locals {
  common_tags = {
    "ManagedBy"   = "Terraform"
    "Owner"       = "TodoAppTeam"
    "Environment" = "dev"
  }
}

module "resource_group" {
  source      = "../../modules/azurerm_resource_group"
  rg_name     = "rg-avnesh-aks"
  rg_location = "centralindia"
  rg_tags     = local.common_tags
}

module "storage_account" {
  depends_on  = [module.resource_group]
  source      = "../../modules/azurerm_storage_account"
  sg_name     = "rgstorageavnesh"
  rg_name     = "rg-avnesh-aks"
  rg_location = "centralindia"
  tags        = local.common_tags
}

module "container_registry" {
  depends_on = [module.resource_group, module.storage_account]
  source     = "../../modules/azurerm_container_registory"
  acr_name   = "rgacravnesh"
  rg_name    = "rg-avnesh-aks"
  location   = "centralindia"
  tags       = local.common_tags
}

module "kubernetes_cluster" {
  depends_on   = [module.resource_group, module.storage_account, module.container_registry]
  source       = "../../modules/azurerm_kubernets_cluster"
  aks_name     = "rgaksavnesh"
  aks_location = "centralindia"
  rg_name      = "rg-avnesh-aks"
  dns_prefix   = "rgaksavnesh"
  node_count   = 2
  tags         = local.common_tags
}