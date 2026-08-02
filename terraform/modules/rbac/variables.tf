############################################################
# Project Crystal
# Module : Kubernetes RBAC
############################################################

############################################################
# Platform Administrator Group
############################################################

variable "platform_admin_group" {

  description = "Platform Administrator Group Name"

  type = string

}

############################################################
# CI/CD Service Account
############################################################

variable "cicd_service_account_name" {

  description = "CI/CD Service Account Name"

  type = string

}

variable "cicd_namespace" {

  description = "CI/CD Service Account Namespace"

  type = string

}
