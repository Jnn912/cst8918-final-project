variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account (must be globally unique, lowercase letters and numbers only)"
  type        = string
}

resource "azurerm_storage_account" "tfstate" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = "canadacentral"  
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false  

  tags = {
    environment = "terraform-state"
    project     = "cst8918-final-project"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"  
}