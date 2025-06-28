

# resource "azurerm_public_ip" "pip" {
#   name                = var.public_ip_name
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   allocation_method   = var.allocation_method
#   sku                 = var.sku

# }

resource "azurerm_public_ip" "pip" {
  for_each = var.pip_child
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku

}

