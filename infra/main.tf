terraform {
  required_version = "~> 1.2.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.71.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
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