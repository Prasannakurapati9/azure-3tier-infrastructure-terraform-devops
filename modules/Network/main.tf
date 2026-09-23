resource "azurerm_resource_group" "rg01" {
  name     = var.rg_name
  location = var.location
}

locals {
  Web-ASG = azurerm_application_security_group.Asg01.id
    App-ASG = azurerm_application_security_group.Asg02.id
  Db-ASG  = azurerm_application_security_group.Asg03.id
}

# Create a resource group

# Create a virtual network within the resource group

resource "azurerm_virtual_network" "Vnet01" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "Snet01" {
  name          = "${var.Snet01}"
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.Vnet01.name
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "Snet02" {
  name          = "${var.Snet02}"
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.Vnet01.name
  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "Snet03" {
  name          = "${var.Snet03}"
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.Vnet01.name
  address_prefixes = ["10.0.3.0/24"]
}

resource "azurerm_subnet" "Snet04" {
  name          = "${var.Snet04}"
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.Vnet01.name
  address_prefixes = ["10.0.4.0/26"]
}

resource "azurerm_subnet" "Snet05" {
  name          = "${var.Snet05}"
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.Vnet01.name
  address_prefixes = ["10.0.5.0/26"]
}

resource "azurerm_application_security_group" "Asg01" {
  name                = "Web-Asg"
  location            = azurerm_resource_group.rg01.location
  resource_group_name = var.rg_name
}
resource "azurerm_network_security_group" "Nsg01" {
  name                = "WEBNSG"
  location            = azurerm_resource_group.rg01.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "Allow-Internet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_application_security_group_ids = [local.Web-ASG]
  }
}

resource "azurerm_application_security_group" "Asg02" {
  name                = "App-Asg"
  location            = azurerm_resource_group.rg01.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_group" "Nsg02" {
  name                = "AppNSG"
  location            = azurerm_resource_group.rg01.location
  resource_group_name = var.rg_name


security_rule {
    name                       = "Allow-Web-To-App"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_application_security_group_ids = [local.Web-ASG]
    destination_application_security_group_ids = [local.App-ASG]
}
 
}

resource "azurerm_application_security_group" "Asg03" {
  name                = "DB-Asg"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_group" "Nsg03" {
  name                = "DBNSG"
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name

security_rule {
    name                       = "Allow-App-To-DB"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1433"
    source_application_security_group_ids = [local.App-ASG]
    destination_application_security_group_ids = [local.Db-ASG]
  }

}

