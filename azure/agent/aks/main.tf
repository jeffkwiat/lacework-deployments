module "agent" {
  source  = "lacework/agent/kubernetes"
  version = "~> 1.1.0"

  lacework_access_token = var.lacework_access_token
  lacework_agent_tags = {"KubernetesCluster": var.kube_cluster_name}
  lacework_image = "lacework/datacollector:3.9.5"
}