output "resource_group_id" {
    value   = azurerm_resource_group.web_page.id
}

output "url" {
    value = azurerm_app_service.website.default_site_hostname
}


output "keyvault_id" {
    value   = azurerm_key_vault.keyvault.id
}

output "vnet_id" {
    value = azurerm_virtual_network.vnet.id
}

output "cdn_profile_id" {
    value = azurerm_cdn_profile.cdn_profile.id
}

output "application_gateway_id" {
    value = azurerm_application_gateway.application_gateway.id
}

output "app_service_id" {
    value = azurerm_app_service.website.id
}

output "redis_cache_id" {
    value = azurerm_redis_cache.redis_cache.id
}
output "cosmos_id" {
    value = azurerm_cosmosdb_sql_database.cosmosdb_sql_database.id
}


output "id" {
  description = "The Container Registry ID"
  value       = azurerm_container_registry.acr.id
}

output "login_server" {
  description = "The URL that can be used to log into the container registry."
  value       = azurerm_container_registry.acr.login_server
}