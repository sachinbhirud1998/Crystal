############################################################
# Project Crystal
# Production RBAC
############################################################

variable "aws_region" {

  description = "AWS Region"

  type = string

}


variable "platform_admin_group" {

  description = "Platform Administrator Group"

  type = string

}

variable "cicd_service_account_name" {

  description = "CI/CD Service Account"

  type = string

}

variable "cicd_namespace" {

  description = "CI/CD Namespace"

  type = string

}
