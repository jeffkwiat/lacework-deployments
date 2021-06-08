terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
      version = "0.5.0"
    }
  }
}

provider "lacework" {}