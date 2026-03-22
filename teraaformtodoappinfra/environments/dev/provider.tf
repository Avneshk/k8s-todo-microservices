terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.65.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "09250277-3461-4a76-b62f-8499b8d4c172"
}


