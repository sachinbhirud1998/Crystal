############################################################
# Project Crystal
# Production OIDC Provider
############################################################

############################################################
# EKS Remote State
############################################################

data "terraform_remote_state" "eks_cluster" {

  backend = "local"

  config = {

    path = "../eks-cluster/terraform.tfstate"

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
