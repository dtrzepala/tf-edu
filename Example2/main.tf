resource "azurerm_resource_group" "rg-application" {
  name     = "rg-example1-test-001"
  location = var.location

  tags = var.tags
}