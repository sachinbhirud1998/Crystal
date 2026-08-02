############################################################
# Project Crystal
# Module      : EKS Add-ons
############################################################

############################################################
# Cluster
############################################################

variable "cluster_name" {

  description = "Amazon EKS Cluster Name"

  type = string

}

variable "cluster_version" {

  description = "Amazon EKS Kubernetes Version"

  type = string

}

############################################################
# Amazon EBS CSI Driver IRSA
############################################################

variable "ebs_csi_irsa_role_arn" {

  description = "IAM Role ARN used by Amazon EBS CSI Driver"

  type = string

}

############################################################
# Conflict Resolution
############################################################

variable "resolve_conflicts_on_create" {

  description = "Conflict resolution during creation"

  type = string

  default = "OVERWRITE"

}

variable "resolve_conflicts_on_update" {

  description = "Conflict resolution during update"

  type = string

  default = "OVERWRITE"

}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Common Tags"

  type = map(string)

  default = {}

}