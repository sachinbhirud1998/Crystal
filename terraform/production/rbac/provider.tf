############################################################
# Project Crystal
# Production RBAC
############################################################

provider "aws" {

  region = var.aws_region

  profile = var.aws_profile

}

############################################################
# EKS Cluster Remote State
############################################################

data "terraform_remote_state" "eks_cluster" {

  backend = "local"

  config = {

    path = "../eks-cluster/terraform.tfstate"

  }

}

############################################################
# Kubernetes Authentication
############################################################

data "aws_eks_cluster_auth" "this" {

  name = data.terraform_remote_state.eks_cluster.outputs.cluster_name

}

############################################################
# Kubernetes Provider
############################################################

provider "kubernetes" {

  host = data.terraform_remote_state.eks_cluster.outputs.cluster_endpoint

  cluster_ca_certificate = base64decode(
    data.terraform_remote_state.eks_cluster.outputs.cluster_certificate_authority_data
  )

  token = data.aws_eks_cluster_auth.this.token

}
