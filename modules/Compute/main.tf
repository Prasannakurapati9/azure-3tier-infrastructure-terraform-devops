
resource "azurerm_network_interface" "nic01" {
  name                = "Web-nic"
  location            =  var.rg_name
  resource_group_name =  "${var.location}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  var.web_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "VM01" {
  name                = "Web-VM"
  resource_group_name =  var.rg_name
  location            = "UkSouth"
  size                = "Standard_D2as_v7"
  admin_username      = "azureuser"
  admin_password      = "${var.admin_password}"
  network_interface_ids = [
    azurerm_network_interface.nic01.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "nic02" {
  name                = "Web-nic02"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  var.web_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "VM02" {
  name                = "Web-VM02"
  resource_group_name =  var.rg_name
  location            = "East US"
  size                = "Standard_D2as_v7"
  admin_username      = "azureuser"
  admin_password      = "${var.admin_password}"
  network_interface_ids = [
    azurerm_network_interface.nic02.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "nic03" {
  name                = "App-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  var.app_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "VM03" {
  name                = "App-VM"
  resource_group_name =  var.rg_name
  location            = "East US"
  size                = "Standard_D2as_v7"
  admin_username      = "azureuser"
  admin_password      = "${var.admin_password}"
  network_interface_ids = [
    azurerm_network_interface.nic03.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "nic04" {
  name                = "DB-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  var.db_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "VM04" {
  name                = "DB-VM"
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_D2as_v5"
  admin_username      = "azureuser"
  admin_password      = "Nationindia@91"
  network_interface_ids = [
    azurerm_network_interface.nic04.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}


