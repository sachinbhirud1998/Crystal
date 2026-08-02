############################################################
# Project Crystal
# Production EKS Add-ons
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
# IRSA Remote State
############################################################

data "terraform_remote_state" "irsa" {

  backend = "local"

  config = {

    path = "../irsa/terraform.tfstate"

  }

}

############################################################
# Production EKS Managed Add-ons
############################################################

module "production_eks_addons" {

  source = "../../modules/eks-addons"

  ##########################################################
  # Cluster Configuration
  ##########################################################

  cluster_name = data.terraform_remote_state.eks_cluster.outputs.cluster_name

  kubernetes_version = data.terraform_remote_state.eks_cluster.outputs.cluster_version

  ##########################################################
  # Managed Add-ons
  ##########################################################

  addons = {

    ########################################################
    # Amazon VPC CNI
    ########################################################

    vpc-cni = {

      resolve_conflicts_on_create = "OVERWRITE"

      resolve_conflicts_on_update = "OVERWRITE"

    }

    ########################################################
    # CoreDNS
    ########################################################

    coredns = {

      resolve_conflicts_on_create = "OVERWRITE"

      resolve_conflicts_on_update = "OVERWRITE"

    }

    ########################################################
    # kube-proxy
    ########################################################

    kube-proxy = {

      resolve_conflicts_on_create = "OVERWRITE"

      resolve_conflicts_on_update = "OVERWRITE"

    }

    ########################################################
    # Amazon EBS CSI Driver
    ########################################################

    aws-ebs-csi-driver = {

      resolve_conflicts_on_create = "OVERWRITE"

      resolve_conflicts_on_update = "OVERWRITE"

      service_account_role_arn = data.terraform_remote_state.irsa.outputs.ebs_csi_role_arn

    }

  }

  ##########################################################
  # Tags
  ##########################################################

  tags = var.common_tags

}