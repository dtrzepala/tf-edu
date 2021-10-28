resource "azurerm_resource_group" "rg-application-storages" {
  name     = "rg-example2storages-test-001"
  location = "west europe"

  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}

resource "azurerm_storage_account" "app-storage" {
  name                      = "stexample2test001dt"
  location                  = azurerm_resource_group.rg-application-storages.location
  resource_group_name       = azurerm_resource_group.rg-application-storages.name
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = false
  allow_blob_public_access  = true
}
