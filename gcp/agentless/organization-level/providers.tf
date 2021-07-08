terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
      version = "0.5.0"
    }

    google = {
      source = "hashicorp/google"
      version = "3.74.0"
    }
  }
}

provider "google" {
  credentials = file("lacework-credentials.json")
  project = var.project_id
}

provider "lacework" {}

module "gcp_organization_config" {
  source = "lacework/config/gcp"
  version = "1.0.5"

  org_integration = var.org_integration
  organization_id = var.organization_id
  project_id = var.project_id
}

module "gcp_organization_level_audit_log" {
  source               = "lacework/audit-log/gcp"
  version              = "~> 1.0"
  bucket_force_destroy = true
  org_integration      = var.org_integration
  organization_id      = var.organization_id

  use_existing_service_account = true
  service_account_name = module.gcp_organization_config.service_account_name
  service_account_private_key = module.gcp_organization_config.service_account_private_key
}