output "key_vault_id" {
  description = "Key Vault resource ID"
  value       = azurerm_key_vault.kv01.id
}

output "key_vault_name" {
  description = "Key Vault name"
  value       = azurerm_key_vault.kv01.name
}

output "key_vault_uri" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.kv01.vault_uri
}