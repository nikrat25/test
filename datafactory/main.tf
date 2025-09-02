terraform {
  backend "local" {}
}

data "azurerm_resource_group" "existing_rg" {
  name = "rg-mars-poc"
}

resource "azurerm_data_factory" "main" {
  name                = var.adf_name
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name

  identity {
    type = "SystemAssigned"
  }

  public_network_enabled = var.public_network_enabled

  tags = var.tags
}
