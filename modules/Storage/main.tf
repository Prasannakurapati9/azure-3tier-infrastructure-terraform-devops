
resource "azurerm_storage_account" "stgacc" {
  name                     = var.stg_name
  resource_group_name      =  var.rg_name
  location                 =  var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_storage_share" "Fileshare" {
  name               = "fileshare"
  storage_account_id = azurerm_storage_account.stgacc.id
  quota              = 100
}

resource "azurerm_storage_container" "Container01" {
  name                  = "app"
  storage_account_id    = azurerm_storage_account.stgacc.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "Blob" {
  name                 = "appblob"
  storage_container_id = azurerm_storage_container.Container01.id
  type                 = "Block"
}

resource "azurerm_private_endpoint" "PE01" {
  name                = "Test-PE"
  location            =  var.location
  resource_group_name =  var.rg_name
  subnet_id           = var.private_endpoint_subnet_id

  private_service_connection {
    name                           = "stg-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.stgacc.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

}
