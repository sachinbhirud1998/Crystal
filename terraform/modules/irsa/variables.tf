############################################################
# Project Crystal
# Module      : IAM Role for Service Account (IRSA)
############################################################

############################################################
# IAM Role
############################################################

variable "role_name" {

  description = "IAM Role Name"

  type = string

}

variable "role_description" {

  description = "IAM Role Description"

  type = string

}

############################################################
# EKS OIDC
############################################################

variable "oidc_provider_arn" {

  description = "Amazon EKS OIDC Provider ARN"

  type = string

}

variable "oidc_provider_url" {

  description = "Amazon EKS OIDC Provider URL"

  type = string

}

############################################################
# Kubernetes
############################################################

variable "namespace" {

  description = "Kubernetes Namespace"

  type = string

}

variable "service_account_name" {

  description = "Kubernetes Service Account Name"

  type = string

}

############################################################
# IAM Policies
############################################################

variable "managed_policy_arns" {

  description = "Managed Policy ARNs"

  type = list(string)

  default = []

}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Common Resource Tags"

  type = map(string)

  default = {}

}