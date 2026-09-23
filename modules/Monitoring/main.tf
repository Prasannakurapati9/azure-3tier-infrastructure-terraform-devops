
resource "azurerm_log_analytics_workspace" "log01" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_workspace" "monitor01" {
  name                 = var.monitor_workspace_name
  resource_group_name  = var.rg_name
  location             = var.location
  
}
