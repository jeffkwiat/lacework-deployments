terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.62.0"
    }
  }
}

provider "azurerm" {
  features {}
}