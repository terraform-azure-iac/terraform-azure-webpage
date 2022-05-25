## Variables that needs to be changed depending on the use

//Change depending on main contact for security/events
variable "security_center_contact_email" {
    type      = string
    default   = "test@test.com" 
}


//For setting the phone number to the contact person for the Defender for cloud
variable "security_center_contact_phone" {
    type      = string
    default   = "+47-12345678" 
}

## Variables containing names, dosent need to be changed before apply

variable "sentinel_alert_rule_fusion_name" {
    type      = string
    default   = "wp-fusion" 
}

variable "sentinel_alert_machine_learning_name" {
    type      = string
    default   = "wp-sentinel-machinelearning" 
}

variable "sentinel_alert_rule_ms_security_incident_name" {
    type      = string
    default   = "wp-ms-incident" 
}

variable "sentinel_data_connector_azure_security_center_name" {
    type      = string
    default   = "security-center-connector" 
}

variable "sentienl_watchlist_name" {
    type      = string
    default   = "sentinel_watchlist_wp" 
}

variable "sentienl_watchlist_item_name" {
    type      = string
    default   = "0aac6fa5-223e-49cf-9bfd-3554dc9d2b76" 
}


## Imported variables from other modules, to connect the module together with existing resources. Dosent need change before apply

variable "log_analytic_workspace_id" {
    type      = string
    default   = ""
}

variable "log_analytics_solution_id" {
    type      = string
    default   = ""
}

variable "log_analytics_solution_workspace_resource_id" {
    type      = string
    default   = ""
}