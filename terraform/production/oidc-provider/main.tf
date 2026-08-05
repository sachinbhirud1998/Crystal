############################################################
# Project Crystal
# Production OIDC Provider
############################################################

############################################################
# EKS Remote State
############################################################

data "terraform_remote_state" "eks_cluster" {

  backend = "s3"

  config = {

    bucket = "crystal-tfstate-987654321"

    key = "production/eks-cluster/terraform.tfstate"

    region = "ap-south-1"

    profile = "shared-services"

  }

}

############################################################
# OIDC Provider
############################################################

module "production_oidc_provider" {

  source = "../../modules/oidc-provider"

  oidc_url = data.terraform_remote_state.eks_cluster.outputs.cluster_oidc_issuer_url

  tags = var.common_tags

}