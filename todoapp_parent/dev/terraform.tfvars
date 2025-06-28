

rg_parent = {
  "rg1" = {
    resource_group_name = "todoappankur"
    location            = "Australia East"
  }
}

vnet_parent = {
  "vnet1" = {
    vnet_name           = "todoappankur-vnet"
    location            = "Australia East"
    resource_group_name = "todoappankur"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet_parent = {
  "frontend_subnet" = {
    subnet_name         = "frontend_subnet"
    resource_group_name = "todoappankur"
    vnet_name           = "todoappankur-vnet"
    address_prefixes    = ["10.0.1.0/24"]
  }

  "backend_subnet" = {
    subnet_name         = "backend_subnet"
    resource_group_name = "todoappankur"
    vnet_name           = "todoappankur-vnet"
    address_prefixes    = ["10.0.2.0/24"]
  }

}
pip_parent = {
  "frontend_public_ip" = {
    public_ip_name      = "pip-front"
    resource_group_name = "todoappankur"
    location            = "Australia East"
    allocation_method   = "Static"
    sku                 = "Basic"
  }

  "backend_public_ip" = {
    public_ip_name      = "pip-back"
    resource_group_name = "todoappankur"
    location            = "Australia East"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
}

keyvault_parent = {
  "kv1" = {
    key_vault_name      = "kv-todoapp-ankur"
    vault_location      = "Australia East"
    resource_group_name = "todoappankur"
  }
}
keyvaultsecret_parent = {
  "vm-username" = {
    secret_name  = "vm-username"
    secret_value = "adminuser"

  }
  "vm-password" = {
    secret_name  = "vm-password"
    secret_value = "Ankur@121212"

  }

}



# vm_parent = {
#   "frontend_vm" = {
#     nic_name             = "nic-frontend-vm"
#     location             = "Australia East"
#     resource_group_name  = "todoappankur"
#     ipconfig_name        = "ipconfig-frontend"
    
#     vm_name              = "frontend-vm"
#     vm_size              = "Standard_D2s_v3"
#     vm_image_publisher   = "Canonical"
#     vm_image_offer       = "0001-com-ubuntu-server-jammy"
#     vm_image_sku         = "22_04-lts"
#     vm_image_version     = "latest"
#   }
  

#   "backend_vm" = {
#     nic_name            = "nic-backend-vm"
#     location            = "Australia East"
#     resource_group_name = "todoappankur"
#     ipconfig_name       = "ipconfig-backend"
#     subnet_name         = "backend_subnet"
#     public_ip           = "pip-back"
#     virtual_network_name = "todoappankur-vnet"
#     key_vault_name      = "kv-todoapp-ankur"
#     secret_username     = "vm-username"
#     secret_password     = "vm-password"
#     vm_name             = "backend-vm"
#     location            = "Australia East"
#     vm_size             = "Standard_D2s_v3"
#     vm_image_publisher  = "Canonical"
#     vm_image_offer      = "0001-com-ubuntu-server-focal"
#     vm_image_sku        = "20_04-lts"
#     vm_image_version    = "latest"
#   }
# }
