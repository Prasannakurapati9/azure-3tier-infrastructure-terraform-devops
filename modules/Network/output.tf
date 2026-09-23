
output "vnet_id" {
  value = azurerm_virtual_network.Vnet01.id
}

output "snet01_id" {
  value = azurerm_subnet.Snet01.id
}

output "snet02_id" {
  value = azurerm_subnet.Snet02.id
}

output "snet03_id" {
  value = azurerm_subnet.Snet03.id
}

output "snet04_id" {
  value = azurerm_subnet.Snet04.id
}

output "snet05_id" {
  value = azurerm_subnet.Snet05.id
}

output "web_asg_id" {
  value = azurerm_application_security_group.Asg01.id
}

output "app_asg_id" {
  value = azurerm_application_security_group.Asg02.id
}

output "db_asg_id" {
  value = azurerm_application_security_group.Asg03.id
}