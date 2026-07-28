############################################################
# Project Crystal
# Module      : Subnet
# Milestone   : 2.2
#
# Purpose
# -------
# Creates reusable Public and Private Subnets.
#
# USER INPUT REQUIRED?
# No
############################################################

terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}