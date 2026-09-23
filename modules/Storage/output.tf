
output "storage_account_id" {
  description = "Storage Account ID"
  value       = azurerm_storage_account.stgacc.id
}

output "storage_account_name" {
  description = "Storage Account name"
  value       = azurerm_storage_account.stgacc.name
}

output "file_share_id" {
  description = "Azure File Share ID"
  value       = azurerm_storage_share.Fileshare.id
}

output "container_id" {
  description = "Blob container ID"
  value       = azurerm_storage_container.Container01.id
}

output "private_endpoint_id" {
  description = "Storage Private Endpoint ID"
  value       = azurerm_private_endpoint.PE01.id
}