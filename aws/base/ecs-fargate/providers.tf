terraform {
  required_providers {
    lacework = {
      source  = "lacework/lacework"
      version = "0.5.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "3.40.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

# https://registry.terraform.io/providers/lacework/lacework/latest
provider "lacework" {}