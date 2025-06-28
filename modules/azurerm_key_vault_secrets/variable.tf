# variable "secret_name" {
# }
# variable "secret_value" {
# }
variable "key_vault_name" {}
variable "resource_group_name" {}

variable "keyvaultsecret_child" {
  type = map(any)

}
