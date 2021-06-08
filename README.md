# Lacework Deployments
This repository contains Terraofrm examples of the agentless-based and agent-based AWS, Azure, and GCP Lacework 
integrations.  This repository targets those who would like to create a new environment and then integrate with 
Lacework.

Currently, this repository contains the following examples:

1. `/aws/agentless`- Amazon Web Services

## Amazon Web Services (AWS)
### Prerequisties
- `Lacework CLI`
- `AWS CLI v2`
### Agentless

#### Prerequisties
The Agentless setup assumes you have an already established AWS account with resources deployed.

#### Authentication
Authentication for AWS requires an `access_key` and a `secret_key`, which you can get from the AWS console, when you 
create an IAM user.
#### What this repository does?
We configure the agent-less Lacework integration to pull Compliance and Configuration, as well as the CloudTrail 
integration for User/API Behavior analytics.
#### How to deploy the integrations
- Ensure the Prerequisties are downloaded/installed onto the host you are running Terraform
- Run `terraform init` to download the Terraform providers/modules for AWS and Lacework.
- Run `terraform plan` to see what resources will be deployed into your environment
- Run `terraform apply` to deploy those resources to your AWS environment and configure the Lacework integration

### Agent-based Cloud Workload Security
#### Prerequisties
No other additional prerequisties are required.

#### Fargate - Sidecar
This example creates a new Fargate cluster, using the `sample-app` image used within the AWS "Get Started" tour.
  In this example, we add the Lacework agent as a sidecar, within the task definition.
#### Fargate - Docker Image
This example creates a new Fargate cluster, using the `sample-app` image used within the AWS "Get Started" tour.
  In this example, we add the Lacework agent as a sidecar, within the task definition.
#### AWS System Manager (SSM)


## Microsoft Azure
### Authentication
Authentication for Azure occurs via the Azure CLI
- Run `az login`
- Complete authentication within the browser
- This must be done before `terraform apply` will work
### What this repository does?
We configure the agent-less Lacework integration to pull Compliance and Configuration, as well as the Audit Log 
integration for User/API Behavior analytics.
### How to deploy the integrations
- Ensure the Prerequisties are downloaded/installed onto the host you are running Terraform
- Run `terraform init` to download the Terraform providers/modules for AWS and Lacework.
- Run `terraform plan` to see what resources will be deployed into your environment
- Run `terraform apply` to deploy those resources to your AWS environment and configure the Lacework integration

### AKS (Azure Kubernetes Service)
The code under [./azure/base/aks](/azure/base/aks) allows you to spin up an AKS cluster.  You can then use the Lacework 
Kubernetes integration to deploy the agent across all nodes.

#### Notes
- Download both the Kubernetes Config and Kubernetes Orchestration files from the Settings --> Agents page within your 
account.  Run the following commands:
  
```
kubectl create -f lacework-cfg-k8s.yaml
kubectl create -f lacework-k8s.yaml

```
## Google Cloud Platform (GCP)
### Authentication
Authentication for GCP occurs via a JSON credential file, you download from the Google Cloud Console in JSON format.
### What this repository does?
We configure the agent-less Lacework integration to pull Compliance and Configuration, as well as the Audit Trail 
integration for User/API Behavior analytics.
### How to deploy the integrations
- Ensure the Prerequisties are downloaded/installed onto the host you are running Terraform
- Run `terraform init` to download the Terraform providers/modules for AWS and Lacework.
- Run `terraform plan` to see what resources will be deployed into your environment
- Run `terraform apply` to deploy those resources to your AWS environment and configure the Lacework integration
### GKE (Google Kubernetes Engine)
The code under [./gcp/base/gke](/gcp/base/gke) allows you to spin up an AKS cluster.  You can then use the Lacework 
Kubernetes integration to deploy the agent across all nodes.