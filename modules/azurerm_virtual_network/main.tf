

# resource "azurerm_virtual_network" "Vnet" {
#   name                = var.virtual_network_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   address_space       = var.address_space

# }

resource "azurerm_virtual_network" "Vnet" {
  for_each            = var.vnet_child
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space

}
