############################################################
# Project Crystal
# Production EKS Add-ons
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
# EBS CSI Driver IRSA
############################################################

variable "ebs_csi_role_name" {

  description = "IAM Role Name for Amazon EBS CSI Driver"

  type = string

}

############################################################
# Common Tags
############################################################

variable "common_tags" {

  description = "Common Resource Tags"

  type = map(string)

}