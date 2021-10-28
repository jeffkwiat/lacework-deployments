# Lacework Deployments

[![HIPAA](https://app.soluble.cloud/api/v1/public/badges/201d9f99-ac31-4d96-8e99-e7976092148f.svg)](https://app.soluble.cloud/repos/details/github.com/jeffkwiat/lacework-deployments)  [![CIS](https://app.soluble.cloud/api/v1/public/badges/8bad0e5d-8a26-4c56-bdd4-f00f158ec9bd.svg)](https://app.soluble.cloud/repos/details/github.com/jeffkwiat/lacework-deployments)  [![IaC](https://app.soluble.cloud/api/v1/public/badges/483e7ee2-43e6-4056-8c05-772a1472247d.svg)](https://app.soluble.cloud/repos/details/github.com/jeffkwiat/lacework-deployments)  
This repository contains Terraofrm examples of the agentless-based and agent-based AWS, Azure, and GCP Lacework 
integrations.  This repository targets those who would like to create a new environment and then integrate with 
Lacework.

## Amazon Web Services (AWS)
#### Authentication
### Deployments
The following deployments are provided via Terraform
#### Agentless
The following agentless-based integrations allow you to easily get up-and-running with Lacework's agentless integration
- [AWS CloudTrail and Config New CloudTrail](./aws/agentless)- 

#### Agent
#### Base (without Lacework)

---

## Microsoft Azure
### Authentication
```
az login
```

### Deployments
The following deployments are provided via Terraform

#### Agentless
The following agentless-based integrations allow you to easily get up-and-running with Lacework's agentless integration
- [Azure Config & Activity Log](./azure/agentless)

#### Agent
- [Azure Kubernetes Service (AKS)](./azure/agent/aks/)

#### Base (without Lacework)
- [Azure Kubernetes Service (AKS)](./azure/base/aks/) - spin up an empty AKS cluster

---

### Google Cloud Platform (GCP)
#### Authentication
```
gcloud auth login
```
### Deployments
The following deployments are provided via Terraform
- [Organization Level GCP with new Service Account](./gcp/agentless/organization-level)

#### Agentless
The following agentless-based integrations allow you to easily get up-and-running with Lacework's agentless integration

#### Agent

#### Base (without Lacework)
