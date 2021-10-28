resource "azurerm_resource_group" "rg-application" {
  name     = "rg-example1-test-001"
  location = "west europe"

  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}