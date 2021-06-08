terraform {
  required_providers {
    lacework = {
      source  = "lacework/lacework"
      version = "0.4.0"
    }

    azuread = {
      source = "hashicorp/azuread"
      version = "1.5.0"
    }

    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.26.0"
    }
  }
}

provider "azuread" {}

provider "azurerm" {
  features {}
}

# https://registry.terraform.io/providers/lacework/lacework/latest
provider "lacework" {}

module "az_config" {
  source  = "lacework/config/azure"
  version = "0.1.4"
}

module "az_activity_log" {
  source  = "lacework/activity-log/azure"
  version = "0.1.4"
}