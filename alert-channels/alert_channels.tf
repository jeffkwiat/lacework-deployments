# Datadog
resource "lacework_alert_channel_datadog" "alert_channel_datadog" {
  name      = var.datadog_name
  datadog_site = var.datadog_site
  datadog_service = var.datadog_service
  api_key = var.datadog_api_key
}

# Slack
resource "lacework_alert_channel_slack" "alert_channel_slack" {
  name = var.slack_name
  slack_url = var.slack_url
}

# Webhook
resource "lacework_alert_channel_webhook" "alert_channel_webhook" {
  name = "Webhooks Alerts"
  webhook_url = var.webhook_url
}