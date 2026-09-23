
resource "azurerm_public_ip" "PIP01" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "Test-LB" {
  name                = "App-LB"
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.PIP01.id
  }
}

resource "azurerm_lb_backend_address_pool" "web-backend" {
  name            = "Webbackendpool"
  loadbalancer_id = azurerm_lb.Test-LB.id
}

resource "azurerm_network_interface_backend_address_pool_association" "web_vm01" {
  network_interface_id    = var.web_nic01_id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.web-backend.id
}

resource "azurerm_network_interface_backend_address_pool_association" "web_vm02" {
  network_interface_id    = var.web_nic02_id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.web-backend.id
}

resource "azurerm_lb_probe" "probe01" {
  loadbalancer_id = azurerm_lb.Test-LB.id
  name            = "http-running"
  protocol        = "Tcp"
  port            = 80
}

resource "azurerm_lb_rule" "rule01" {
  loadbalancer_id = azurerm_lb.Test-LB.id
  name            = "HTTPRule"
  protocol        = "Tcp"

  frontend_port = 80
  backend_port  = 80

  frontend_ip_configuration_name = "PublicIPAddress"

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.web-backend.id
  ]

  probe_id = azurerm_lb_probe.probe01.id
}