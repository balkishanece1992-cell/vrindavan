terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rg" {
    name = "mala_rg"
  location = "eastus"
}
resource "azurerm_virtual_network" "vnet" {
  depends_on = [ azurerm_resource_group.rg ]
  name = "bala_vnet"
  location = "eastus"
  resource_group_name = "mala_rg"
  address_space = [ "10.0.0.0/16" ]
}
