############################################################
# Project Crystal
# Production EKS Cluster
############################################################

############################################################
# AWS Configuration
############################################################

variable "aws_region" {

  description = "AWS Region"

  type = string

}

variable "aws_profile" {

  description = "AWS CLI Profile"

  type = string

}

############################################################
# EKS Cluster
############################################################

variable "cluster_name" {

  description = "Amazon EKS Cluster Name"

  type = string

}

variable "kubernetes_version" {

  description = "Amazon EKS Kubernetes Version"

  type = string

}

############################################################
# IAM
############################################################

variable "cluster_role_name" {

  description = "IAM Role Name"

  type = string

}

############################################################
# Networking
############################################################

variable "private_subnet_names" {

  description = "Private subnet names"

  type = list(string)

}

############################################################
# Endpoint
############################################################

variable "endpoint_private_access" {

  description = "Enable Private Endpoint"

  type = bool

  default = true

}

variable "endpoint_public_access" {

  description = "Enable Public Endpoint"

  type = bool

  default = true

}

variable "public_access_cidrs" {

  description = "Allowed CIDRs"

  type = list(string)

}

############################################################
# Logging
############################################################

variable "enabled_cluster_log_types" {

  description = "Control Plane Logs"

  type = list(string)

  default = []

}

############################################################
# Common Tags
############################################################

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

}