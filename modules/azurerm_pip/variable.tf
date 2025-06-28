# variable "public_ip_name" {}
# variable "resource_group_name" {}
# variable "location" {}
# variable "allocation_method" {}
# variable "sku" {}

variable "pip_child" {
  type = map(any)
}