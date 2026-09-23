

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "kv01" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.rg_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
  rbac_authorization_enabled  = true
}

/*resource "azurerm_role_assignment" "DB_kv_access" {
  scope                = azurerm_key_vault.kv01.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_windows_virtual_machine.VM04.identity[1].principal_id
}*/
