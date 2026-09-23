output "loadbalancer_id" {
  description = "Load Balancer resource ID"
  value       = azurerm_lb.Test-LB.id
}

output "public_ip_id" {
  description = "Public IP resource ID"
  value       = azurerm_public_ip.PIP01.id
}

output "public_ip_address" {
  description = "Public IP address of the Load Balancer"
  value       = azurerm_public_ip.PIP01.ip_address
}

output "backend_pool_id" {
  description = "Web backend pool ID"
  value       = azurerm_lb_backend_address_pool.web-backend.id
}

output "health_probe_id" {
  description = "Load Balancer health probe ID"
  value       = azurerm_lb_probe.probe01.id
}