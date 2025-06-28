terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
  # required_version = ">= 1.5.0"
  # backend "azurerm" {
  #   resource_group_name  = "tf-backend-rg1"
  #   storage_account_name = "scbackend9711970195"
  #   container_name       = "tfstate"
  #   key                  = "terraform.tfstate"
  #   subscription_id = "332de106-8035-4f48-a71e-790b9e30e3ff"
  # }
  
}

provider "azurerm" {
  # Configuration optionsf
  features {}
  subscription_id = "332de106-8035-4f48-a71e-790b9e30e3ff"
}