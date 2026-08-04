############################################################
# Project Crystal
# Milestone 2.1
# Shared Services Networking
#
# Purpose:
# Locks Terraform and AWS Provider versions for this
# deployment stack.
#
# USER INPUT REQUIRED?
# No
############################################################

terraform {
  required_version = ">= 1.11.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}