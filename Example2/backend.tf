terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfbackend"
    storage_account_name = "stterraformfisexamples"
    container_name       = "states"
    key                  = "example2.terraform.tfstate"
  }
}