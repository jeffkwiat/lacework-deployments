# Datadog Variables
variable "datadog_name" {
  type = string
  default = "Datadog Alerts"
}

variable "datadog_site" {
  type = string
  default = "com"
}

variable "datadog_service" {
  type = string
  default = "Logs Detail"
}

variable "datadog_api_key" {
  type = string
  default = ""
}


# Slack Variables
variable "slack_name" {
  type = string
  default = "Slack Alerts"
}

variable "slack_url" {
  type = string
  default = ""
}


# Webhook Variables
variable "webhook_url" {
  type = string
  default = ""
}
