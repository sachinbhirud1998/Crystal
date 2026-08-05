############################################################
# Project Crystal
# Production EKS Managed Node Group
############################################################

############################################################
# AWS Configuration
############################################################

variable "aws_region" {

  description = "AWS Region"

  type = string

}


############################################################
# Node Group
############################################################

variable "node_group_name" {

  description = "Amazon EKS Managed Node Group Name"

  type = string

}

############################################################
# IAM
############################################################

variable "node_role_name" {

  description = "IAM Role Name for the Worker Nodes"

  type = string

}

############################################################
# Networking
############################################################

variable "private_subnet_names" {

  description = "Private Subnet Names"

  type = list(string)

}

############################################################
# EC2 Configuration
############################################################

variable "instance_types" {

  description = "EC2 Instance Types"

  type = list(string)

}

variable "capacity_type" {

  description = "Capacity Type"

  type = string

}

variable "ami_type" {

  description = "Amazon EKS Optimized AMI Type"

  type = string

}

variable "disk_size" {

  description = "Worker Node Root Volume Size"

  type = number

}

############################################################
# Scaling Configuration
############################################################

variable "desired_size" {

  description = "Desired Worker Nodes"

  type = number

}

variable "min_size" {

  description = "Minimum Worker Nodes"

  type = number

}

variable "max_size" {

  description = "Maximum Worker Nodes"

  type = number

}

############################################################
# Kubernetes Labels
############################################################

variable "labels" {

  description = "Node Labels"

  type = map(string)

  default = {}

}

############################################################
# Common Tags
############################################################

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

}