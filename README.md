# Lacework Deployments
This repository contains Terraofrm examples of the agentless-based and agent-based AWS, Azure, and GCP Lacework 
integrations.  This repository targets those who would like to create a new environment and then integrate with 
Lacework.

Currently, this repository contains the following examples:

#### AWS
1. [aws/agentless/](./aws/agentless)- AWS CloudTrail and Config New CloudTrail

#### GCP
2. [gcp/agentless/organization-level](./gcp/agentless/organization-level) - Organization Level GCP with new Service Account

#### Azure
3. [azure/agentless/](./azure/agentless/) - 

## Amazon Web Services (AWS)
#### Authentication

## Microsoft Azure
### Authentication
`az login`
### Deployments
The following deployments are provided via Terraform
#### Agentless
The following agentless-based integrations allow you to easily get up-and-running with Lacework's agentless integration
- [Azure Config & Activity Log](./azure/agentless)

#### Agent
- [Azure Kubernetes Service (AKS)](./azure/agent/aks/)

#### Base (without Lacework)
- [Azure Kubernetes Service (AKS)](./azure/base/aks/) - spin up an empty AKS cluster

### Google Cloud Platform (GCP)
#### Authentication
`gcloud auth login`