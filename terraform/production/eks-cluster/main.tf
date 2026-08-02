############################################################
# Project Crystal
# Production EKS Cluster
############################################################

############################################################
# Production Networking Remote State
############################################################

data "terraform_remote_state" "networking" {

  backend = "local"

  config = {
    path = "../networking/terraform.tfstate"
  }

}

############################################################
# EKS Control Plane IAM Role
############################################################

module "eks_cluster_iam_role" {

  source = "../../modules/iam-role"

  role_name        = var.cluster_role_name
  role_description = "IAM Role for Project Crystal Production EKS Control Plane"

  service_principal = "eks.amazonaws.com"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  ]

  tags = merge(
    var.common_tags,
    {
      Name = var.cluster_role_name
    }
  )

}

############################################################
# Local Values
############################################################

locals {

  private_subnet_ids = [

    for subnet_name in var.private_subnet_names :

    data.terraform_remote_state.networking.outputs.private_subnet_ids[subnet_name]

  ]

}

############################################################
# Amazon EKS Cluster
############################################################

module "production_eks_cluster" {

  source = "../../modules/eks-cluster"

  ##########################################################
  # Cluster Configuration
  ##########################################################

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version

  ##########################################################
  # IAM
  ##########################################################

  cluster_role_arn = module.eks_cluster_iam_role.role_arn

  ##########################################################
  # Networking
  ##########################################################

  private_subnet_ids = local.private_subnet_ids

  endpoint_private_access = var.endpoint_private_access
  endpoint_public_access  = var.endpoint_public_access

  public_access_cidrs = var.public_access_cidrs

  ##########################################################
  # Logging
  ##########################################################

  enabled_cluster_log_types = var.enabled_cluster_log_types

  ##########################################################
  # Tags
  ##########################################################

  tags = var.common_tags

  ##########################################################
  # Dependencies
  ##########################################################

  depends_on = [
    module.eks_cluster_iam_role
  ]

}

############################################################
# Bastion -> EKS Kubernetes API
############################################################

resource "aws_security_group_rule" "bastion_to_eks_api" {

  type = "ingress"

  description = "Allow Bastion to access EKS Kubernetes API"

  security_group_id = module.production_eks_cluster.cluster_security_group_id

  source_security_group_id = data.terraform_remote_state.networking.outputs.bastion_security_group_id

  protocol = "tcp"

  from_port = 443

  to_port = 443

}