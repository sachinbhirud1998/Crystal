############################################################
# Project Crystal
# Production EKS Managed Node Group
############################################################

############################################################
# Production Networking Remote State
############################################################

data "terraform_remote_state" "networking" {

  backend = "s3"

  config = {

    bucket = "crystal-tfstate-987654321"

    key = "production/networking/terraform.tfstate"

    region = "ap-south-1"

    profile = "shared-services"

  }

}

############################################################
# Production EKS Remote State
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
# Worker Node IAM Role
############################################################

module "eks_node_role" {

  source = "../../modules/iam-role"

  role_name = var.node_role_name

  role_description = "IAM Role for Project Crystal Production EKS Worker Nodes"

  service_principal = "ec2.amazonaws.com"

  managed_policy_arns = [

    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",

    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",

    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly",

    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

  ]

  tags = merge(

    var.common_tags,

    {

      Name = var.node_role_name

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
# Amazon EKS Managed Node Group
############################################################

module "production_eks_node_group" {

  source = "../../modules/eks-node-group"

  ##########################################################
  # EKS Cluster
  ##########################################################

  cluster_name = data.terraform_remote_state.eks_cluster.outputs.cluster_name

  node_group_name = var.node_group_name

  ##########################################################
  # IAM
  ##########################################################

  node_role_arn = module.eks_node_role.role_arn

  ##########################################################
  # Networking
  ##########################################################

  private_subnet_ids = local.private_subnet_ids

  ##########################################################
  # EC2 Configuration
  ##########################################################

  instance_types = var.instance_types

  capacity_type = var.capacity_type

  ami_type = var.ami_type

  disk_size = var.disk_size

  ##########################################################
  # Scaling Configuration
  ##########################################################

  desired_size = var.desired_size

  min_size = var.min_size

  max_size = var.max_size

  ##########################################################
  # Kubernetes Labels
  ##########################################################

  labels = var.labels

  ##########################################################
  # Tags
  ##########################################################

  tags = var.common_tags

  ##########################################################
  # Dependencies
  ##########################################################

  depends_on = [

    module.eks_node_role

  ]

}