variable "kube_config_path" {
  description = "Path to Kubernetes config file"
  default = "~/.kube/config"
}

variable "kube_config_context" {
  description = "Kubernetes context to use"
  default = "default"
}

variable "kube_cluster_name" {
  description = "Name of Kubernetes Cluster to appear in Lacework UI dropdowns, etc"
}

variable "lacework_access_token" {
  description = "Lacework Access Token, created from your account's UI, under Settings --> Agents"
}