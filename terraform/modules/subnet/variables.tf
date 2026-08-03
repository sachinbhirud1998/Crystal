############################################################
# Project Crystal
# Reusable Subnet Module
############################################################

############################################################
# VPC
############################################################

variable "vpc_id" {

  description = "VPC ID"

  type = string

}

############################################################
# Public Subnets
############################################################

variable "public_subnets" {

  description = "Public Subnets"

  type = map(object({

    cidr = string
    az   = string

  }))

}

############################################################
# Private Subnets
############################################################

variable "private_subnets" {

  description = "Private Subnets"

  type = map(object({

    cidr = string
    az   = string

  }))

}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Common Tags"

  type = map(string)

  default = {}

}

############################################################
# Kubernetes Tags
############################################################

variable "kubernetes_tags" {

  description = "Optional Kubernetes subnet tags"

  type = map(string)

  default = {}

}