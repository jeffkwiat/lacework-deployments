# Create an agent access token in Lacework
resource "lacework_agent_access_token" "ssm_deployment" {
  name        = "ssm-deployment"
  description = "Used to deploy agents using AWS System Manager"
}

# Create AWS SSM Document
module "lacework_aws_ssm_agents_install" {
  source = "lacework/ssm-agent/aws"
  version = "~> 0.5.0"

  lacework_access_token = lacework_agent_access_token.ssm_deployment.id

}

# Create an AWS Resource group for EC2 Instances with
# the tag 'environment:testing'
resource "aws_resourcegroups_group" "testing" {
  name = "testing"

  resource_query {
    query = jsonencode({
      ResourceTypeFilters = [
        "AWS::EC2::Instance"
      ]

      TagFilters = [
        {
          Key = "Environment"
          Values = [
            "testing"
          ]
        }
      ]
    })
  }
}

# Create an SSM Association group called install-lacework-agents-testing-group
resource "aws_ssm_association" "lacework_aws_ssm_agents_install_testing" {
  association_name = "install-lacework-agents-testing-group"

  name = module.lacework_aws_ssm_agents_install.ssm_document_name

  targets {
    key = "resource-groups:Name"
    values = [
      aws_resourcegroups_group.testing.name,
    ]
  }

  compliance_severity = "HIGH"
}