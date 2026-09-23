
output "log_analytics_workspace_id" {
  description = "Log Analytics workspace resource ID"
  value       = azurerm_log_analytics_workspace.log01.id
}

output "log_analytics_workspace_name" {
  description = "Log Analytics workspace name"
  value       = azurerm_log_analytics_workspace.log01.name
}

output "monitor_workspace_id" {
  description = "Azure Monitor workspace resource ID"
  value       = azurerm_monitor_workspace.monitor01.id
}

output "monitor_workspace_name" {
  description = "Azure Monitor workspace name"
  value       = azurerm_monitor_workspace.monitor01.name
}