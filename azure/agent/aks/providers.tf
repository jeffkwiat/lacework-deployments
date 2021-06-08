terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.3.1"
    }
    lacework = {
      source = "lacework/lacework"
      version = "~> 0.5"
    }
  }
}

provider "kubernetes" {
  config_path    = var.kube_config_path
  config_context = var.kube_config_context
}

provider "lacework" {}