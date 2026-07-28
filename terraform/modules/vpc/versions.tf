############################################################
# Project Crystal
# Module      : VPC
# Milestone   : 2.1
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