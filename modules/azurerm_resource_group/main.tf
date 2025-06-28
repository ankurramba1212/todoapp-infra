
# resource "azurerm_resource_group" "rg" {
#     name     = var.resource_group_name
#     location = var.resource_group_location
  
# }


resource "azurerm_resource_group" "rg" {
    for_each = var.rg_child
    name     = each.value.resource_group_name
    location = each.value.location
  
}