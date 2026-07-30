############################################################
# Project Crystal
# Module : EKS Cluster
############################################################

############################################################
# Cluster
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

variable "cluster_role_arn" {

  description = "IAM Role ARN"

  type = string

}

############################################################
# Networking
############################################################

variable "private_subnet_ids" {

  description = "Private Subnet IDs"

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

  default = []

}

############################################################
# Logging
############################################################

variable "enabled_cluster_log_types" {

  description = "Enabled Cluster Log Types"

  type = list(string)

  default = []

}

############################################################
# Tags
############################################################

variable "tags" {

  description = "Resource Tags"

  type = map(string)

  default = {}

}