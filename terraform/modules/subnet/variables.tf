############################################################
# Project Crystal
# Subnet Module
#
# USER INPUT REQUIRED?
# No
#
# Values are supplied from the calling module.
############################################################

##############################
# VPC
##############################

variable "vpc_id" {
  description = "VPC ID where subnets will be created."
  type        = string
}

##############################
# PUBLIC SUBNETS
##############################

variable "public_subnets" {
  description = "Public subnet configuration."

  type = map(object({
    cidr = string
    az   = string
  }))
}

##############################
# PRIVATE SUBNETS
##############################

variable "private_subnets" {
  description = "Private subnet configuration."

  type = map(object({
    cidr = string
    az   = string
  }))
}

##############################
# TAGS
##############################

variable "tags" {
  description = "Common tags."

  type = map(string)

  default = {}
}