terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.15.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.52.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "vault" {
  # Configuration options
}
