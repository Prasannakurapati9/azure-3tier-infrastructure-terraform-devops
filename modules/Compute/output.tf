
output "web_nic01_id" {
  description = "ID of Web NIC 01"
  value       = azurerm_network_interface.nic01.id
}

output "web_nic02_id" {
  description = "ID of Web NIC 02"
  value       = azurerm_network_interface.nic02.id
}

output "app_nic_id" {
  description = "ID of App NIC"
  value       = azurerm_network_interface.nic03.id
}

output "db_nic_id" {
  description = "ID of DB NIC"
  value       = azurerm_network_interface.nic04.id
}

output "db_vm_id" {
  description = "ID of DB virtual machine"
  value       = azurerm_windows_virtual_machine.VM04.id
}