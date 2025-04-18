# infra/modules/network/main.tf
resource "azurerm_resource_group" "main" {
  name     = "cst8918-final-project-group-${var.group_number}"
  location = "canadacentral"
  tags = {
    environment = var.environment
  }
}

resource "azurerm_virtual_network" "main" {
  name                = "final-project-vnet-${var.environment}"
  address_space       = ["10.0.0.0/14"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "subnets" {
  for_each = {
    prod  = "10.0.0.0/16"
    test  = "10.1.0.0/16"
    dev   = "10.2.0.0/16"
    admin = "10.3.0.0/16"
  }

  name                 = "${each.key}-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [each.value]
}