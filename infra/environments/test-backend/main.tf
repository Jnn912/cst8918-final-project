module "backend" {
  source              = "../../modules/backend"
  resource_group_name = "cst8918-final-project-group"
  storage_account_name = "tfstategroup5123$(local.random_suffix)"  
}

locals {
  random_suffix = substr(md5(azurerm_resource_group.example.id), 0, 4)
}