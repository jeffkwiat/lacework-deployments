variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "location" {
  description = "Azure Kubernetes Service Cluster location"
  default     = "US West 2"
}

variable "cluster_name" {
  description = "Azure Kubernetes Cluster name"
  default     = "aks-cluster"
}