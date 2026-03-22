resource "azurerm_storage_account" "sg" {
  name                     = var.sg_name
  resource_group_name      = var.rg_name
  location                 = var.rg_location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = var.tags
}


