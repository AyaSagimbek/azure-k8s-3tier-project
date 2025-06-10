resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-aks-project-new"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Public subnet
resource "azurerm_subnet" "public" {
  name                 = "subnet-public"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [azurerm_virtual_network.vnet]
}

# Private subnet (for AKS)
resource "azurerm_subnet" "private" {
  name                 = "subnet-private"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
   depends_on = [azurerm_virtual_network.vnet]
}
