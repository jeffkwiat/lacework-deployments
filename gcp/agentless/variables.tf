variable "organization_id" {
  type = string
  default = ""
  sensitive = true
}

variable "project_id" {
  type = string
  default = ""
  sensitive = true
}

variable "org_integration" {
  type = bool
  default = true
}