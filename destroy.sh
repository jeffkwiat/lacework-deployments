#!/bin/bash
AWS="no"
GCP="yes"
AZURE="yes"
ALERT_CHANNELS="no"


if [ $ALERT_CHANNELS = "yes" ]; then
  echo Destroying Alert Channels Integration
  cd ./alert-channels
  terraform destroy --auto-approve
  cd ..
fi

if [ $AWS = "yes" ]; then
  echo Destroying AWS Agentless Integration
  cd ./aws/agentless
  terraform destroy --auto-approve
  cd ../..
fi

if [ $AZURE = "yes" ]; then
  echo Destroying Azure Agentless Integration
  cd ./azure/agentless
  terraform init
  terraform plan
  terraform destroy --auto-approve
  cd ../..
fi

if [ $GCP = "yes" ]; then
  echo Destroying GCP Agentless Integration
  cd ./gcp/agentless/organization-level
  terraform init
  terraform plan
  terraform destroy --auto-approve
  cd ../..
fi