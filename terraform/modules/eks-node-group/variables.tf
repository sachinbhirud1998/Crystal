############################################################
# Project Crystal
# Module      : EKS Node Group
############################################################

############################################################
# EKS Cluster
############################################################

variable "cluster_name" {

  description = "Amazon EKS Cluster Name"

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

variable "node_role_arn" {

  description = "IAM Role ARN for the Worker Nodes"

  type = string

}

############################################################
# Networking
############################################################

variable "private_subnet_ids" {

  description = "Private Subnet IDs for the Worker Nodes"

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

  description = "Capacity Type (ON_DEMAND or SPOT)"

  type = string

  default = "ON_DEMAND"

}

variable "ami_type" {

  description = "Amazon EKS Optimized AMI Type"

  type = string

  default = "AL2023_x86_64_STANDARD"

}

variable "disk_size" {

  description = "Worker Node Root Volume Size (GB)"

  type = number

  default = 20

}

############################################################
# Scaling Configuration
############################################################

variable "desired_size" {

  description = "Desired Number of Worker Nodes"

  type = number

}

variable "min_size" {

  description = "Minimum Number of Worker Nodes"

  type = number

}

variable "max_size" {

  description = "Maximum Number of Worker Nodes"

  type = number

}

############################################################
# Kubernetes Labels
############################################################

variable "labels" {

  description = "Kubernetes Node Labels"

  type = map(string)

  default = {}

}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Common Resource Tags"

  type = map(string)

  default = {}

}