resource "azurerm_resource_group" "budget" {
    name        = "${var.resource_group_name}-${var.environment}"
    location    = var.location
}

data "azurerm_subscription" "current" {}

resource "azurerm_monitor_action_group" "monitor_action_group" {
    name                = var.webhook_reciver_name
    resource_group_name = azurerm_resource_group.budget.name
    short_name          = "budgetaction"

    dynamic "email_receiver" {
        for_each    = var.reciver
        content {
            name                    = "${email_receiver.value.name}-email"
            email_address           = email_receiver.value.email_address
            use_common_alert_schema = email_receiver.value.use_common_alert_schema
        }
    } 
    webhook_receiver {
        name                    = "webhook-reciver"
        service_uri             = var.webhook_reciver_uri
        use_common_alert_schema = true
    }

    dynamic "sms_receiver" {
        for_each        = var.reciver
        content {
            name            = "${sms_receiver.value.name}-sms"
            country_code    = sms_receiver.value.country_code
            phone_number    = sms_receiver.value.phone_number
        }
    }
}

resource "azurerm_consumption_budget_subscription" "consumption_budget_subscription" {
    name            = var.consumption_budget_subscription_name
    subscription_id = data.azurerm_subscription.current.id

    amount     = var.consumption_budget_subscription_amount
    time_grain = var.consumption_budget_subscription_time_grain

    time_period {
        start_date = var.consumption_budget_subscription_time_period[0]
        end_date   = var.consumption_budget_subscription_time_period[1]
    }


    # This notification is activated when the cost for the period is 80% of the set amount
    notification {
        enabled         = true
        threshold       = 80.0
        threshold_type  = "Actual"
        operator        = "EqualTo"

        contact_groups  = [
            azurerm_monitor_action_group.monitor_action_group.id,
        ]
    }

    # This notification is activated when it is forcasted/estimated that the cost will surpase 110% of the set amount
    notification {
        enabled        = true
        threshold      = 110.0
        operator       = "GreaterThan"
        threshold_type = "Forecasted"

        contact_groups  = [
            azurerm_monitor_action_group.monitor_action_group.id,
        ]
    }
}

#Notifies when it the cost for the period is 75% and 100% of the set amount for the IoT resource group
resource "azurerm_consumption_budget_resource_group" "consumption_budget_resource_group" {
    name                = var.consumption_budget_resource_group_name
    resource_group_id   = var.web_page_resource_group_id
    amount              = var.consumption_budget_resource_group_amount
    time_grain          = var.consumption_budget_resource_group_time_grain
    time_period {
        start_date = var.consumption_budget_resource_group_time_period[0]
        end_date   = var.consumption_budget_resource_group_time_period[1]
    }
    notification {
        enabled         = true
        operator        = "GreaterThan"
        threshold       = 75.0
        threshold_type  = "Actual"

        contact_groups  = [
            azurerm_monitor_action_group.monitor_action_group.id,
        ] 
    }

    notification {
        enabled         = true
        operator        = "GreaterThan"
        threshold       = 100
        threshold_type  = "Actual"

        contact_groups  = [
            azurerm_monitor_action_group.monitor_action_group.id,
        ] 
    }     

}