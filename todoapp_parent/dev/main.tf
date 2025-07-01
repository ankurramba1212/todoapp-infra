

#sggsgsgsgsgsgsgsgs

module "resource_group" {
  source   = "../../modules/azurerm_resource_group"
  rg_child = var.rg_parent

}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_virtual_network"
  vnet_child = var.vnet_parent

}

module "subnet" {
  depends_on   = [module.virtual_network]
  source       = "../../modules/azurerm_subnet"
  subnet_child = var.subnet_parent

}

module "public_ip" {
  depends_on = [module.subnet]
  source     = "../../modules/azurerm_pip"
  pip_child  = var.pip_parent
}

module "key_vault" {
  depends_on     = [module.resource_group]
  source         = "../../modules/azurerm_key_vault"
  keyvault_child = var.keyvault_parent
}


# module "vm-username" {
#   depends_on          = [module.key_vault]
#   source              = "../../modules/azurerm_key_vault_secrets"
#   secret_name         = "vm-username"
#   secret_value        = "adminuser"
#   key_vault_name      = "kv-todoapp-ankur"
#   resource_group_name = "todoappankur"

# }

# module "vm-password" {
#   depends_on          = [module.key_vault]
#   source              = "../../modules/azurerm_key_vault_secrets"
#   secret_name         = "vm-password"
#   secret_value        = "Ankur@121212"
#   key_vault_name      = "kv-todoapp-ankur"
#   resource_group_name = "todoappankur"

# }

module "secrets" {
  depends_on           = [module.key_vault]
  source               = "../../modules/azurerm_key_vault_secrets"
  keyvaultsecret_child = var.keyvaultsecret_parent
  key_vault_name       = "kv-todoapp-ankur"
  resource_group_name  = "todoappankur"
}

# module "vm" { 
#   depends_on            = [module.subnet, module.public_ip, module.secrets, module.key_vault]
#   source                = "../../modules/azurerm_virtual_machine"
#   vm_child              = var.vm_parent
# }

module "frontend_vm" {
  depends_on = [module.subnet, module.public_ip,module.secrets, module.key_vault]
  source     = "../../modules/azurerm_virtual_machine"

  nic_name             = "nic-frontend-vm"
  location             = "Australia East"
  resource_group_name  = "todoappankur"
  ipconfig_name        = "ipconfig-frontend-vm"
  vm_name              = "frontend-vm"
  vm_size              = "Standard_D2s_v3"
  vm_image_publisher   = "Canonical"
  vm_image_offer       = "0001-com-ubuntu-server-jammy"
  vm_image_sku         = "22_04-lts"
  vm_image_version     = "latest"
  public_ip            = "pip-front"
  subnet_name          = "frontend_subnet"
  virtual_network_name = "todoappankur-vnet"
  key_vault_name       = "kv-todoapp-ankur"
  secret_username      = "vm-username"
  secret_password      = "vm-password"

}



module "backend_vm" {
  depends_on = [module.subnet, module.public_ip,module.secrets, module.key_vault]
  source     = "../../modules/azurerm_virtual_machine"

  nic_name             = "nic-backend-vm"
  location             = "Australia East"
  resource_group_name  = "todoappankur"
  ipconfig_name        = "ipconfig-backend-vm"
  vm_name              = "backend-vm"
  vm_size              = "Standard_D2s_v3"
  vm_image_publisher   = "Canonical"
  vm_image_offer       = "0001-com-ubuntu-server-focal"
  vm_image_sku         = "20_04-lts"
  vm_image_version     = "latest"
  public_ip            = "pip-back"
  subnet_name          = "backend_subnet"
  virtual_network_name = "todoappankur-vnet"
  key_vault_name       = "kv-todoapp-ankur"
  secret_username      = "vm-username"
  secret_password      = "vm-password"

}

module "sql_server" {
  depends_on          = [module.resource_group,module.secrets, module.key_vault]
  source              = "../../modules/azurerm_sql_server"
  sql_server_name     = "sqlserver-todoapp-ankur"
  resource_group_name = "todoappankur"
  location            = "Australia East"
  key_vault_name      = "kv-todoapp-ankur"
  secret_username     = "vm-username"
  secret_password     = "vm-password"

}

module "sql_database" {
  depends_on          = [module.sql_server ]
  source              = "../../modules/azurerm_sql_database"
  sql_database_name   = "todoappdbankur"
  resource_group_name = "todoappankur"
  sql_server_name     = "sqlserver-todoapp-ankur"

}


