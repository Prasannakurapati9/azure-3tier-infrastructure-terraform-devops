data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg01" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_virtual_network" "Vnet01" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
} 

module "network" {
  source = "./modules/Network"

  rg_name  = azurerm_resource_group.rg01.name
  location = azurerm_resource_group.rg01.location

  vnet_name = var.vnet_name

  Snet01 = var.Snet01
  Snet02 = var.Snet02
  Snet03 = var.Snet03
  Snet04 = var.Snet04
  Snet05 = var.Snet05
}

module "compute" {
  source = "./modules/Compute"

   rg_name            = azurerm_resource_group.rg01.name
  location            = azurerm_resource_group.rg01.location

  web_subnet_id = module.network.snet01_id
  app_subnet_id = module.network.snet02_id
  db_subnet_id  = module.network.snet03_id

  db_asg_id = module.network.db_asg_id

  admin_password = var.admin_password
}


module "loadbalancer" {
  source = "./modules/LoadBalancers"

  rg_name   = azurerm_resource_group.rg01.name
  location            = azurerm_resource_group.rg01.location

  web_nic01_id = module.compute.web_nic01_id
  web_nic02_id = module.compute.web_nic02_id
}

module "storage" {
  source = "./modules/Storage"

  rg_name   = azurerm_resource_group.rg01.name
  location            = azurerm_resource_group.rg01.location

  private_endpoint_subnet_id = module.network.snet05_id
  stg_name   = var.stg_name
}

module "keyvault" {
  source = "./modules/Keyvault"

  rg_name  = azurerm_resource_group.rg01.name
  location            = azurerm_resource_group.rg01.location

  key_vault_name = var.key_vault_name
  tenant_id      = data.azurerm_client_config.current.tenant_id
}

module "monitoring" {
  source = "./modules/Monitoring"

  rg_name   = azurerm_resource_group.rg01.name
  location            = azurerm_resource_group.rg01.location

  log_analytics_name     = var.log_analytics_name
  monitor_workspace_name = var.monitor_workspace_name
}