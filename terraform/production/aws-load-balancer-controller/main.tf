############################################################
# Project Crystal
# Production AWS Load Balancer Controller
############################################################

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
# Networking Remote State
############################################################

data "terraform_remote_state" "networking" {

  backend = "local"

  config = {

    path = "../networking/terraform.tfstate"

  }

}

############################################################
# IRSA Remote State
############################################################

data "terraform_remote_state" "irsa" {

  backend = "local"

  config = {

    path = "../irsa/terraform.tfstate"

  }

}

############################################################
# AWS Load Balancer Controller
############################################################

module "production_aws_load_balancer_controller" {

  source = "../../modules/aws-load-balancer-controller"

  ##########################################################
  # EKS
  ##########################################################

  cluster_name = data.terraform_remote_state.eks_cluster.outputs.cluster_name

  ##########################################################
  # AWS
  ##########################################################

  aws_region = var.aws_region

  vpc_id = data.terraform_remote_state.networking.outputs.vpc_id

  ##########################################################
  # IRSA
  ##########################################################

  service_account_role_arn = data.terraform_remote_state.irsa.outputs.alb_controller_role_arn

  ##########################################################
  # Helm
  ##########################################################

  chart_version = var.chart_version

  ##########################################################
  # Tags
  ##########################################################

  tags = var.common_tags

}
