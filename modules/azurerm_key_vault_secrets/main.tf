
data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name

}

resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.keyvaultsecret_child
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.kv.id

}
