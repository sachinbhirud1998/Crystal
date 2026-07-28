############################################################
# Project Crystal
# Module: Security Group
############################################################

############################################################
# VPC
############################################################

variable "vpc_id" {
  description = "VPC ID where the Security Group will be created"
  type        = string
}

############################################################
# Security Group
############################################################

variable "security_group_name" {
  description = "Name of the Security Group"
  type        = string
}

############################################################
# SSH Access
############################################################

variable "allowed_ssh_cidrs" {
  description = "List of CIDR blocks allowed to SSH into the management servers"

  type    = list(string)
  default = []
}

############################################################
# Tags
############################################################

variable "tags" {
  description = "Common tags applied to all resources"

  type    = map(string)
  default = {}
}