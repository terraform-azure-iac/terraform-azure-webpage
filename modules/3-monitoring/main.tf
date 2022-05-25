//A resoruce group for the monitorig resources, for seperation, making it more clear
resource "azurerm_resource_group" "monitoring" {
    name      = "${var.resource_group_name}-${var.environment}" 
    location  = var.location
}

//
data "azurerm_subscription" "current" {
#data.azurerm_subscription.current.subscription_id
}

#Event Hubs
//Sets up an eventhub namespace, needed for the creation of an eventhub
resource "azurerm_eventhub_namespace" "eventhub_namespace" {
    name                 = var.eventhub_namespace_name
    resource_group_name  = azurerm_resource_group.monitoring.name
    location             = var.location
    sku                  = var.eventhub_namespace_sku
    capacity             = var.eventhub_namespace_capacity
}

//Creates an eventhub using the namespace
resource "azurerm_eventhub" "eventhub" {
    name                = var.eventhub_name
    namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
    resource_group_name = azurerm_resource_group.monitoring.name
    partition_count     = var.eventhub_partition_count
    message_retention   = var.eventhub_message_retention
}

#Monitor Action Group
//Makes an action group, which determines who and what should be alerted when an alert is triggered
resource "azurerm_monitor_action_group" "monitor_action_group" {
    name                = var.monitor_action_group_name
    resource_group_name = azurerm_resource_group.monitoring.name
    short_name          = "Web-action"

    webhook_receiver {
        name        = var.webhook_receiver_name
        service_uri = var.webhook_receiver_uri
    }
    
    email_receiver {
        name          = var.email_receiver_name
        email_address = var.email_receiver_epost
    }

    event_hub_receiver {
        name                    = var.event_hub_receiver_name
        event_hub_id            = azurerm_eventhub.eventhub.id
                    #"/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/rg-eventhub/providers/Microsoft.EventHub/namespaces/eventhub-namespace-monitoring/eventhubs/event-hub"
        use_common_alert_schema = false
    } 
/*
    azure_function_receiver {
        name                     =
        function_app_resoruce_id =
        function_name            =
        http_trigger_url         =
    }
  */
}

#Metric Alert
//Sets up metric alerts for the app services
resource "azurerm_monitor_metric_alert" "monitor_metric_alert_app_service" {
    name                = var.monitor_metric_alert_name_ap
    resource_group_name = azurerm_resource_group.monitoring.name
    scopes              = [ var.app_service_id ] 
    description         = "Monitoring of app service in the Web Page Module"

    /*criteria {
        metric_namespace  = 
        metric_name       =
        aggregation       =
        operator          =
        threshold         =
    }
    */

    criteria {
        metric_namespace  = "Microsoft.web/sites"
        metric_name       = "Http404"
        aggregation       = "Maximum"
        operator          = "GreaterThanOrEqual"
        threshold         = 10 #Antall feil
    }

    criteria {
        metric_namespace  = "Microsoft.web/sites"
        metric_name       = "Http5xx"
        aggregation       = "Maximum"
        operator          = "GreaterThanOrEqual"
        threshold         = 10 #Antall feil 
    }

    criteria {
        metric_namespace  = "Microsoft.web/sites"
        metric_name       = "HttpResponseTime"
        aggregation       = "Average"
        operator          = "GreaterThan"
        threshold         = 60 #Antall sekunder
    }

    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }

}

//Sets up metric alerts for the redis cache
resource "azurerm_monitor_metric_alert" "monitor_metric_alert_redis_cache" {
    name                = var.monitor_metric_alert_name_rc
    resource_group_name = azurerm_resource_group.monitoring.name
    scopes              = [ var.redis_cache_id ]
    description         = "Monitoring of redis cache in the Web Page Module"

    criteria {
        metric_namespace  = "Microsoft.cache/redis"
        metric_name       = "cachemissrate"
        aggregation       = "Total"
        operator          = "GreaterThan"
        threshold         = 10 #Antall % miss rate
    }

    criteria {
        metric_namespace  = "Microsoft.cache/redis"
        metric_name       = "errors"
        aggregation       = "Average"
        operator          = "GreaterThan"
        threshold         = 10 #Antall feil gjennomsnittlig
    }

    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }

}

//Sets up metric alerts for the keyvault 
resource "azurerm_monitor_metric_alert" "monitor_metric_alert_keyvault" {
    name                = var.monitor_metric_alert_name_kv
    resource_group_name = azurerm_resource_group.monitoring.name
    scopes              = [ var.keyvault_id ]
    description         = "Monitoring of Keyvault in the Web Page Module"

    criteria {
        metric_namespace  = "Microsoft.keyvault/vaults"
        metric_name       = "ServiceAPILatency"
        aggregation       = "Average"
        operator          = "GreaterThanOrEqual"
        threshold         = 400 #Antall ms
    }

    criteria {
        metric_namespace  = "Microsoft.keyvault/vaults"
        metric_name       = "Availability"
        aggregation       = "Average"
        operator          = "LessThan"
        threshold         = 95 #Antall % 
    }

    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }

}

//Sets up metric alerts for the virtual network 
resource "azurerm_monitor_metric_alert" "monitor_metric_alert_vnet" {
    name                = var.monitor_metric_alert_name_vn
    resource_group_name = azurerm_resource_group.monitoring.name
    scopes              = [ var.vnet_id ]
    description         = "Monitoring of virtual network in the Web Page Module"
    severity            = 0
    
    criteria {
        metric_namespace  = "Microsoft.network/virtualnetworks"
        metric_name       = "ifUnderDDoSAttack"
        aggregation       = "Maximum"
        operator          = "GreaterThanOrEqual"
        threshold         = 1 
    }


    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }

}


#Action Rule
//Makes an action rule group for the specified resoruces from the web-page module
resource "azurerm_monitor_action_rule_action_group" "action_rule_action_group" {
    name                = var.monitor_action_rule_action_group_name
    resource_group_name = azurerm_resource_group.monitoring.name
    action_group_id     = azurerm_monitor_action_group.monitor_action_group.id

    scope {
        type = "Resource"
        resource_ids = [ var.keyvault_id, var.vnet_id, var.cdn_profile_id, var.application_gateway_id, var.app_service_id, var.redis_cache_id, var.cosmos_id ]
    }

    condition {
        monitor_service {
            operator = "Equals"
            values = ["ActivityLog Security" ]
        }
    }
}


#Activity log alert
//Sets up an log alert, which triggers when changes are being made in security groups. (Creation, and updates)
resource "azurerm_monitor_activity_log_alert" "monitor_activity_log_alert_nsg_cu" {
    name                  = var.monitor_activity_log_alert_name_nsg_cu
    resource_group_name   = azurerm_resource_group.monitoring.name
    scopes                = [data.azurerm_subscription.current.id]
    description           = "For monitoring creation and updates for Security Groups"

    criteria {
        operation_name    = "Microsoft.Network/networkSecurityGroups/write"
        category          = "Security"
    }

    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }
}

//Sets up an log alert, which triggers when changes are being made in security groups (Deletion)
resource "azurerm_monitor_activity_log_alert" "monitor_activity_log_alert_nsg_d" {
    name                  = var.monitor_activity_log_alert_name_nsg_d
    resource_group_name   = azurerm_resource_group.monitoring.name
    scopes                = [data.azurerm_subscription.current.id]
    description           = "For monitoring deletion of Network Security Groups"

    criteria {
        operation_name    = "Microsoft.Network/networkSecurityGroups/delete"
        category          = "Security"
    }

    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }
}

#Log profile
//Sets up a monitor log profile, which mainly determines the retention policy for the logs
resource "azurerm_monitor_log_profile" "monitor_log_profile" {
    name                = var.monitor_log_profile_name
    categories          = var.monitor_log_profile_categories
    locations           = var.monitor_log_profile_locations
    servicebus_rule_id  ="${azurerm_eventhub_namespace.eventhub_namespace.id}/authorizationrules/RootManageSharedAccessKey"
    
    retention_policy {
        enabled = true
        days    = 7
    } 

}

#Log analytics workspace
//Creates a workspace for log analytics (Used in another module)
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
    name                = var.log_analytics_workspace_name
    resource_group_name = azurerm_resource_group.monitoring.name
    location            = var.location
    sku                 = var.log_analytics_workspace_sku
    retention_in_days   = var.log_analytics_workspace_retention_days
}

//Creates a log analytics solution (Used in another module)
resource "azurerm_log_analytics_solution" "log_analytics_solution" {
    solution_name           = "SecurityInsights"
    location                = var.location 
    resource_group_name     = azurerm_resource_group.monitoring.name 
    workspace_resource_id   = azurerm_log_analytics_workspace.log_analytics_workspace.id 
    workspace_name          = azurerm_log_analytics_workspace.log_analytics_workspace.name

    plan {
        publisher   = "Microsoft"
        product     = "OMSGallery/SecurityInsights"
    }
}

