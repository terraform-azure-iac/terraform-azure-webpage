variable "environment" {
    type          = string
    default       = ""
    description   = "test/stage/prod environment. This is set in .tfvars files"
}

variable "location" {
    type    = string
    default = "norwayeast"
}

variable "resource_group_name" {
    type    = string
    default = "monitoring-resource-group"
}



#EventHub
variable "eventhub_namespace_name" {
    type    = string
    default = "eventhub-namespace-monitoring"
}

variable "eventhub_namespace_sku" {
    type    = string
    default = "Standard"
}

variable "eventhub_namespace_capacity" {
    type    = number
    default = 1
}

variable "eventhub_name" {
    type    = string
    default = "eventhub-monitoring"
}

variable "eventhub_partition_count" {
    type    = string
    default = "2"
}

variable "eventhub_message_retention" {
    type    = string
    default = "7"
}



#####
variable "monitor_action_group_name" {
    type      = string 
    default   = "monitor-action-group"
}

variable "webhook_receiver_name" {
    type      = string
    default   = "webhook-bachelor-ntnu-test"
}

variable "webhook_receiver_uri" {
    type      = string
    default   = "https://example_webhook.com/123abc"
}

variable "email_receiver_name" {
    type        = string
    default     = "bachelor-ntnu-email"
}

variable "email_receiver_epost" {
    type        = string 
    default     = "test@test.com"
}

variable "event_hub_receiver_name" {
    type        = string 
    default     = "bachelor-ntnu-event-hub-receiver-name"
}

#variable "event_hub_id_subscription" {}

variable "monitor_activity_log_alert_name_nsg_d" {
    type      = string 
    default   = "wb-nsg-delete"
}

variable "monitor_activity_log_alert_name_nsg_cu" {
    type      = string 
    default   = "wb-nsg-create"
}

#variable "eventhub_namespace_name" {
#    type      = string
#    default   = "eventhub-logprofile"
#}

variable "monitor_metric_alert_name_ap" {
    type      = string
    default   = "metric-alert-app-service"
}

variable "monitor_metric_alert_name_rc" {
    type      = string
    default   = "metric-alert-redis-cache"
}

variable "monitor_metric_alert_name_kv" {
    type      = string
    default   = "metric-alert-keyvault"
}

variable "monitor_metric_alert_name_vn" {
    type      = string
    default   = "metric-alert-virtualnetwork"
}

#Action Rule
variable "monitor_action_rule_action_group_name" {
    type = string
    default = "action-rule-group"
}

#Log Profile
variable "monitor_log_profile_name" {
    type    = string
    default = "monitor-log-profile"
}

variable "monitor_log_profile_categories" {
    type    = list(string)
    default = ["Action", "Delete", "Write"]
}

variable "monitor_log_profile_locations" {
    type    = list(string)
    default = [ "norwayeast", "norwaywest" ]
}

#Log analytics workspace
variable "log_analytics_workspace_name" {
    type    = string
    default = "log-analytics-workspace"
}

variable "log_analytics_workspace_sku" {
    type    = string
    default = "PerGB2018"
    description = "Posible values: Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018"
}

variable "log_analytics_workspace_retention_days" {
    type    = number
    default = 30
}

#Variables from web-page

variable "keyvault_id" {
    type        = string
    default     = ""
}

variable "vnet_id" {
    type        = string
    default     = ""
}

variable "cdn_profile_id" {
    type        = string
    default     = ""
}

variable "application_gateway_id" {
    type        = string
    default     = ""
}

variable "app_service_id" {
    type        = string
    default     = ""
}

variable "redis_cache_id" {
    type        = string
    default     = ""
}

variable "cosmos_id" {
    type        = string
    default     = ""
}