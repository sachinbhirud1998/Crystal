############################################################
# Project Crystal
# Reusable EKS Add-ons Module
############################################################

variable "cluster_name" {

  description = "Amazon EKS Cluster Name"

  type = string

}

variable "kubernetes_version" {

  description = "Kubernetes Version"

  type = string

}

variable "addons" {

  description = "Map of EKS Managed Add-ons"

  type = map(object({

    resolve_conflicts_on_create = optional(string)

    resolve_conflicts_on_update = optional(string)

    service_account_role_arn = optional(string)

  }))

}

variable "tags" {

  description = "Common Tags"

  type = map(string)

}