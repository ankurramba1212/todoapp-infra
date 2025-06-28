



resource "azurerm_network_interface" "nic" {
  # for_each = var.vm_child
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ipconfig_name
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip.id

  }

}

resource "azurerm_linux_virtual_machine" "vm" {
  # for_each = var.vm_child
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = data.azurerm_key_vault_secret.vmusername.value
  admin_password                  = data.azurerm_key_vault_secret.vmpassword.value
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic.id, ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt update
    apt install -y nginx
    systemctl enable nginx
    systemctl start nginx
    echo "<h1>Welcome to Azure NGINX VM!</h1>" > /var/www/html/index.html
  EOF
  )
  
}


