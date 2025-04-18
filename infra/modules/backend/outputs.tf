output "storage_account_name" {
  description = "Name of the created storage account"
  value       = azurerm_storage_account.tfstate.name
}

output "container_name" {
  description = "Name of the blob container"
  value       = azurerm_storage_container.tfstate.name
}