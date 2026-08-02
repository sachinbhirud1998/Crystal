############################################################
# Project Crystal
# Module      : AWS Load Balancer Controller
############################################################

############################################################
# EKS Cluster
############################################################

variable "cluster_name" {

  description = "Amazon EKS Cluster Name"

  type = string

}

############################################################
# AWS
############################################################

variable "aws_region" {

  description = "AWS Region"

  type = string

}

variable "vpc_id" {

  description = "Amazon VPC ID"

  type = string

}

############################################################
# IAM
############################################################

variable "service_account_role_arn" {

  description = "IAM Role ARN for AWS Load Balancer Controller IRSA"

  type = string

}

############################################################
# Helm
############################################################

variable "namespace" {

  description = "Kubernetes Namespace"

  type = string

  default = "kube-system"

}

variable "release_name" {

  description = "Helm Release Name"

  type = string

  default = "aws-load-balancer-controller"

}

variable "chart_version" {

  description = "AWS Load Balancer Controller Helm Chart Version"

  type = string

}

############################################################
# Tags
############################################################

variable "tags" {

  description = "Common Resource Tags"

  type = map(string)

}
