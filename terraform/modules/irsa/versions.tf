############################################################
# Project Crystal
# Module      : IAM Role for Service Account (IRSA)
############################################################

terraform {

  required_version = ">= 1.8.0"

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 6.0"

    }

  }

}