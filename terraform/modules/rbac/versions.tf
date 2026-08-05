############################################################
# Project Crystal
# Module : Kubernetes RBAC
############################################################

terraform {

  required_version = ">= 1.8.0"

  required_providers {

    kubernetes = {

      source = "hashicorp/kubernetes"

      version = "~> 2.38"

    }

  }

}
