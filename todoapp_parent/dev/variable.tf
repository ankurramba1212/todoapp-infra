variable "rg_parent" {
  type = map(any)
}

variable "vnet_parent" {
  type = map(any)

}

variable "subnet_parent" {
  type = map(any)
}

variable "pip_parent" {
  type = map(any)
}

variable "keyvault_parent" {
  type = map(any)
}

variable "keyvaultsecret_parent" {
  type = map(any) 
}
# variable "nic_parent" {
#   type = map(any)
# }
# variable "vm_parent" {
#   type = map(any)
# }