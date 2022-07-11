terraform {
  required_version = "~> 1.2.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.71.0"
    }
  }

  # Go ahead and create the resource group, storage account, container and get the key from the Azure Portal and put it on the key field below
  backend "azurerm" {
    resource_group_name  = "playground"
    storage_account_name = "playground-storage-account"
    container_name       = "tfstate"
    key                  = "CHANGE_ME"
  }
}

provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  skip_provider_registration = true
}