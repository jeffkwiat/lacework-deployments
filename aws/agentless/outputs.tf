output "AWS-Config-IAM-Role-Name" {
  value = module.aws_config.iam_role_name
}

output "AWS-Config-IAM-Role-ARN" {
  value = module.aws_config.iam_role_arn
}

output "AWS-Config-IAM-External-ID" {
  value = module.aws_config.external_id
}