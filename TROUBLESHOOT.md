# Troubleshooting Terraform
This document provides some guidance on how to troubleshoot and resolve errors seen when running `terraform apply`

## Azure

#### Error creating AZURE_AL_SEQ integration.  [400] Unable to validate the Azure tenant name, verify your configuration.
```
Error: Error creating AZURE_AL_SEQ integration: 
│   [POST] https://lwintjeffkwiat.lacework.net/api/v1/external/integrations
│   [400] Unable to validate the Azure tenant name, verify your configuration.
│ 
│   with module.az_activity_log.lacework_integration_azure_al.default,
│   on .terraform/modules/az_activity_log/main.tf line 129, in resource "lacework_integration_azure_al" "default":
│  129: resource "lacework_integration_azure_al" "default" {
│ 
```

#### Resolution: Authenticate to Azure

```
az login
```

---

#### Error creating AZURE_CFG integration.  [400] Error detected when fetching Azure tenant, verify your configuration.
```
╷
│ Error: Error creating AZURE_CFG integration: 
│   [POST] https://lwintjeffkwiat.lacework.net/api/v1/external/integrations
│   [400] Error detected when fetching Azure tenant, verify your configuration.
│ 
│   with module.az_config.lacework_integration_azure_cfg.default,
│   on .terraform/modules/az_config/main.tf line 25, in resource "lacework_integration_azure_cfg" "default":
│   25: resource "lacework_integration_azure_cfg" "default" {
│ 
```

#### Resolution: Authenticate to Azure

```
az login
```

---

#### Error: Creating/Updating Log Profile;StatusCode=409

```
│ Error: Error Creating/Updating Log Profile "lacework-log-profile-0849a447": insights.LogProfilesClient#CreateOrUpdate: Failure sending request: StatusCode=409 -- Original Error: autorest/azure: Service returned an error. Status=<nil> <nil>
│ 
│   with module.az_activity_log.azurerm_monitor_log_profile.lacework,
│   on .terraform/modules/az_activity_log/main.tf line 65, in resource "azurerm_monitor_log_profile" "lacework":
│   65: resource "azurerm_monitor_log_profile" "lacework" {
│ 
╵
```

#### Resolution: Delete the Log Profile via the Azure CLI

```
jeffkwiat@Jeffs-MacBook-Pro agentless % az monitor log-profiles list --query '[*].name'                    
[
  "lacework-log-profile-0849a447"
]
jeffkwiat@Jeffs-MacBook-Pro agentless % az monitor log-profiles delete --name lacework-log-profile-0849a447  
```

#### Error: Error building account: Error getting authenticated object ID: Error parsing json result from the Azure CLI: Error retrieving running Azure CLI: Failed to load or parse file /Users/jeffkwiat/.azure/az.sess. It will be overridden by default settings.

```
│ Error: Error building account: Error getting authenticated object ID: Error parsing json result from the Azure CLI: Error retrieving running Azure CLI: Failed to load or parse file /Users/jeffkwiat/.azure/az.sess. It will be overridden by default settings.
│ 
│   with provider["registry.terraform.io/hashicorp/azurerm"],
│   on providers.tf line 22, in provider "azurerm":
│   22: provider "azurerm" {
│ 


```

## GCP



## Alert Channels

#### 403 Forbidden (Datadog, Slack, Webhook, etc.)
```
╷
│ Error: 
│   [GET] https://lwintjeffkwiat.lacework.net/api/v1/external/integrations/LWINTJEF_D935A35DF4216C13BD14D6521AEA193D12EE2D6945193D7
│   [403] Forbidden
│ 
│   with lacework_alert_channel_datadog.alert_channel_datadog,
│   on alert_channels.tf line 2, in resource "lacework_alert_channel_datadog" "alert_channel_datadog":
│    2: resource "lacework_alert_channel_datadog" "alert_channel_datadog" {
│ 
```

#### Resolution: Check the API Key used for the integration

---
