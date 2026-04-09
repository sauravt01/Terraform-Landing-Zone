
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-hardcoded"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "rg-saurav"
}

