############################################################
# Project Crystal
# Module      : VPC
#
# USER INPUT REQUIRED?
# No
#
# Values will be supplied from terraform.tfvars
############################################################

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS Support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS Hostnames"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Common Tags"
  type        = map(string)
  default     = {}
}