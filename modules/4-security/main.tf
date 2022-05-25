//
data "azurerm_subscription" "current" {
    
}

//Sets up alerts for security personell, and activetes alerts
resource "azurerm_security_center_contact" "security_center_contact" {
    email                = var.security_center_contact_email 
    phone                = var.security_center_contact_phone
    alert_notifications  = true
    alerts_to_admins     = true
}

//For connection the Defender to the log analytic workspace
resource "azurerm_security_center_workspace" "name" {
    scope         = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"
    workspace_id  = var.log_analytic_workspace_id
}

//Activiating the Defender for StorageAccounts
resource "azurerm_security_center_subscription_pricing" "security_center_subscription_pricing_sa" {
    tier            = "Standard"
    resource_type   = "StorageAccounts"
}

//Activiating the Defender for AppServices
resource "azurerm_security_center_subscription_pricing" "security_center_subscription_pricing_as" {
    tier            = "Standard"
    resource_type   = "AppServices"
}

//Activiating the Defender for sqlservers
resource "azurerm_security_center_subscription_pricing" "security_center_subscription_pricing_ss" {
    tier            = "Standard"
    resource_type   = "SqlServers"
}

//Activiating the Defender for DNS
resource "azurerm_security_center_subscription_pricing" "security_center_subscription_pricing_dns" {
    tier            = "Standard"
    resource_type   = "Dns"
}

//Activating the a template for sentinel fusion to follow on the log analytic workspace (Sentinel Analytics)
resource "azurerm_sentinel_alert_rule_fusion" "sentinel_alert_rule_fusion" {
    name                        = var.sentinel_alert_rule_fusion_name
    log_analytics_workspace_id  = var.log_analytic_workspace_id
    alert_rule_template_guid    = "f71aba3d-28fb-450b-b192-4e76a83015c8"
}

//Activating the maching learning template on the log analytic workspace (Sentinel Analytics)
resource "azurerm_sentinel_alert_rule_machine_learning_behavior_analytics" "sentinel_alert_machine_learning" {
    name                        = var.sentinel_alert_machine_learning_name
    log_analytics_workspace_id  = var.log_analytic_workspace_id
    alert_rule_template_guid    = "737a2ce1-70a3-4968-9e90-3e6aca836abf"
}

//Activating ms security incident on the log analytic workspace (Sentinel Analytics)
resource "azurerm_sentinel_alert_rule_ms_security_incident" "sentinel_alert_rule_ms_security_incident" {
    name                        = var.sentinel_alert_rule_ms_security_incident_name
    log_analytics_workspace_id  = var.log_analytics_solution_workspace_resource_id
    product_filter              = "Microsoft Cloud App Security" 
    display_name                = "IoT-rule" 
    severity_filter             = [ "High" ]
}

//Connects the Defender for cloud with the Sentinel workspace
resource "azurerm_sentinel_data_connector_azure_security_center" "sentinel_data_connector_azure_security_center" {
    name                        = var.sentinel_data_connector_azure_security_center_name
    log_analytics_workspace_id  = var.log_analytics_solution_workspace_resource_id
}

/*
resource "azurerm_sentinel_watchlist" "sentienl_watchlist" {
    name                        = var.sentienl_watchlist_name
    log_analytics_workspace_id  = var.log_analytics_solution_workspace_resource_id 
    display_name                = "iot-watchlist" 
}

resource "azurerm_sentinel_watchlist_item" "sentienl_watchlist_item" {
    name          = var.sentienl_watchlist_item_name
    watchlist_id  = azurerm_sentinel_watchlist.sentienl_watchlist.id
      properties  = {
        k1 = "v1"
        k2 = "v2"
      }
}
*/