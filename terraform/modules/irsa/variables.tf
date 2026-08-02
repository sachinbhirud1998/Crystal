
variable "role_name" {

  description = "IAM Role Name"

  type = string

}

variable "role_description" {

  description = "IAM Role Description"

  type = string

}

variable "oidc_provider_arn" {

  description = "OIDC Provider ARN"

  type = string

}

variable "oidc_provider_url" {

  description = "OIDC Provider URL"

  type = string

}

variable "namespace" {

  description = "Kubernetes Namespace"

  type = string

}

variable "service_account_name" {

  description = "Kubernetes Service Account"

  type = string

}

variable "managed_policy_arns" {

  description = "Managed IAM Policies"

  type = list(string)

}

variable "tags" {

  description = "Common Tags"

  type = map(string)

}