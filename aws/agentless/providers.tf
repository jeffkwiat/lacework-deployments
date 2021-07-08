terraform {
  required_providers {
    lacework = {
      source  = "lacework/lacework"
      version = "=0.5.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "=3.47.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

# https://registry.terraform.io/providers/lacework/lacework/latest
provider "lacework" {}

# https://registry.terraform.io/modules/lacework/config/aws/latest
module "aws_config" {
  source  = "lacework/config/aws"
  version = "~> 0.2.1"
}

# https://registry.terraform.io/modules/lacework/cloudtrail/aws/latest
module "aws_cloudtrail" {
  source  = "lacework/cloudtrail/aws"
  version = "~> 0.2.1"

  bucket_force_destroy  = true
  use_existing_iam_role = true
  iam_role_name         = module.aws_config.iam_role_name
  iam_role_arn          = module.aws_config.iam_role_arn
  iam_role_external_id  = module.aws_config.external_id
}