############################################################
# Project Crystal
# Module      : Internet Gateway
#
# Milestone   : 2.3
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