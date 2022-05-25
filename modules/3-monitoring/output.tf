output "log_analytic_workspace_id" {
    value = azurerm_log_analytics_workspace.log_analytics_workspace.id
}

output "log_analytics_solution_id" {
    value = azurerm_log_analytics_solution.log_analytics_solution.id
}

output "log_analytics_solution_workspace_resource_id" {
    value = azurerm_log_analytics_solution.log_analytics_solution.workspace_resource_id
}

output "eventhub_id" {
    value = azurerm_eventhub.eventhub.id
}