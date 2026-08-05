############################################################
# Project Crystal
# Production EKS Add-ons
############################################################

############################################################
# EKS Cluster Remote State
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
# IRSA Remote State
############################################################

data "terraform_remote_state" "irsa" {

  backend = "s3"

  config = {

    bucket = "crystal-tfstate-987654321"

    key = "production/irsa/terraform.tfstate"

    region = "ap-south-1"

    profile = "shared-services"

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