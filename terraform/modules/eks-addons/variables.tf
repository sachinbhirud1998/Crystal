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

############################################################
# Amazon VPC CNI
############################################################

variable "vpc_cni_version" {

  description = "Amazon VPC CNI Add-on Version"

  type = string

}

############################################################
# CoreDNS
############################################################

variable "coredns_version" {

  description = "CoreDNS Add-on Version"

  type = string

}

############################################################
# kube-proxy
############################################################

variable "kube_proxy_version" {

  description = "kube-proxy Add-on Version"

  type = string

}

############################################################
# Amazon EBS CSI Driver
############################################################

variable "ebs_csi_driver_version" {

  description = "Amazon EBS CSI Driver Add-on Version"

  type = string

}

############################################################
# Conflict Resolution
############################################################

variable "resolve_conflicts_on_create" {

  description = "Conflict resolution strategy during add-on creation"

  type = string

  default = "OVERWRITE"

}

variable "resolve_conflicts_on_update" {

  description = "Conflict resolution strategy during add-on update"

  type = string

  default = "OVERWRITE"

}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Common Resource Tags"

  type = map(string)

  default = {}

}