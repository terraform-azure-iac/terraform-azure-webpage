variable "environment" {
    type          = string
    default       = ""
    description   = "test/stage/prod environment. This is set in .tfvars files"
}

variable "resource_group_name" {
    type    = string
    default = "budget-monitoring"
} 

variable "location" {
    type    = string
    default = "norwayeast"
}
##################################
#Variables from other modules
variable "web_page_resource_group_id" {
    type    = string
    default = ""
}
##################################

#monitor action group
variable "action_group_name" {
    type    = string
    default = "monitor-action-group"
}

variable "action_group_short_name" {
    type    = string
    default = "budget-mon"
}

variable "reciver" {
    type    = list(object({
        name                    = string
        email_address           = string
        country_code            = string
        phone_number            = string
        use_common_alert_schema = bool
    }))
    default = [{
        name                    = "Employee Name 1"
        email_address           = "employee1@yeet.no"
        country_code            = "47"
        phone_number            = "11111111"
        use_common_alert_schema = true
    },
    {
        name                    = "Employee Name 2"
        email_address           = "employee2@yeet.no"
        country_code            = "47"
        phone_number            = "111111112"
        use_common_alert_schema = true
    }]
}

variable "webhook_reciver_name" {
    type    = string
    default = "budget-webhook"
}

variable "webhook_reciver_uri" {
    type    = string
    default = "https://example_webhook.com/123abc"
}


#consumption budget subscription
variable "consumption_budget_subscription_name" {
    type    = string
    default = "consumption-budget-subscription"
}

variable "consumption_budget_subscription_amount" {
    type    = number
    default = 250
}

variable "consumption_budget_subscription_time_grain" {
    type    = string
    default = "Monthly"
}

variable "consumption_budget_subscription_time_period" {
    type    = list
    default = ["2022-05-01T00:00:00Z", "2023-01-01T00:00:00Z"]
}



#consumption budget resource group
variable "consumption_budget_resource_group_name" {
    type    = string
    default = "consumption-budget-resource-group"
}

variable "consumption_budget_resource_group_amount" {
    type    = number
    default = 100
}

variable "consumption_budget_resource_group_time_grain" {
    type    = string
    default = "Monthly"
}

variable "consumption_budget_resource_group_time_period" {
    type    = list
    default = ["2022-05-01T00:00:00Z", "2023-01-01T00:00:00Z"]
}