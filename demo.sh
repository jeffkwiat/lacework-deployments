#!/bin/bash
AWS="yes"
GCP="yes"
AZURE="yes"
ALERT_CHANNELS="yes"


if [ $ALERT_CHANNELS = "yes" ]; then
  echo Running Alert Channels Integration
  cd ./alert-channels
  terraform init
  terraform plan
  terraform apply --auto-approve
  cd ..
fi

if [ $AWS = "yes" ]; then
  echo Running AWS Agentless Integration
  cd ./aws/agentless
  terraform init
  terraform plan
  terraform apply --auto-approve
  cd ../..
fi

if [ $AZURE = "yes" ]; then
  echo Running Azure Agentless Integration
  cd ./azure/agentless
  terraform init
  terraform plan
  terraform apply --auto-approve
  cd ../..
fi

if [ $GCP = "yes" ]; then
  echo Running GCP Agentless Integration
  cd ./gcp/agentless
  terraform init
  terraform plan
  terraform apply --auto-approve
  cd ../..
fi