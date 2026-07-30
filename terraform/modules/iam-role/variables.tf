############################################################
# Project Crystal
# Module: IAM Role
############################################################

############################################################
# IAM Role
############################################################

variable "role_name" {
  description = "IAM Role name"
  type        = string
}

variable "role_description" {
  description = "IAM Role description"
  type        = string
}

############################################################
# Trust Policy
############################################################

variable "service_principal" {
  description = "AWS service allowed to assume the role"

  type = string
}

############################################################
# Managed Policies
############################################################

variable "managed_policy_arns" {
  description = "List of AWS Managed Policy ARNs"

  type = list(string)

  default = []
}

############################################################
# Tags
############################################################

variable "tags" {
  description = "Common resource tags"

  type = map(string)

  default = {}
}