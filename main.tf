resource "azurerm_resource_group" "sg-vnet-rg" {
  name     = "sg-vnet-rg"
  location = "West Europe"
}

resource "azurerm_network_security_group" "sg-vnet-sec-group" {
  name                = "sg-vnet-sec-group"
  location            = azurerm_resource_group.sg-vnet-rg.location
  resource_group_name = azurerm_resource_group.sg-vnet-rg.name
}

resource "azurerm_virtual_network" "sg-vnet" {
  name                = "sg-vnet"
  location            = azurerm_resource_group.sg-vnet-rg.location
  resource_group_name = azurerm_resource_group.sg-vnet-rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.sg-vnet-sec-group.id
  }

  tags = {
    environment = "development"
  }
}