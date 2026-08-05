############################################################
# Project Crystal
# Module      : EKS Node Group
############################################################

resource "aws_eks_node_group" "this" {

  ##########################################################
  # EKS Cluster
  ##########################################################

  cluster_name = var.cluster_name

  node_group_name = var.node_group_name

  node_role_arn = var.node_role_arn

  ##########################################################
  # Networking
  ##########################################################

  subnet_ids = var.private_subnet_ids

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

  scaling_config {

    desired_size = var.desired_size

    min_size = var.min_size

    max_size = var.max_size

  }

  ##########################################################
  # Kubernetes Labels
  ##########################################################

  labels = var.labels

  ##########################################################
  # Rolling Update Configuration
  ##########################################################

  update_config {

    max_unavailable = 1

  }

  ##########################################################
  # Tags
  ##########################################################

  tags = merge(

    var.tags,

    {

      Name = var.node_group_name

    }

  )

  ##########################################################
  # Timeouts
  ##########################################################

  timeouts {

    create = "45m"

    update = "60m"

    delete = "45m"

  }

  ##########################################################
  # Lifecycle
  ##########################################################

  lifecycle {

    ignore_changes = [

      scaling_config[0].desired_size

    ]

  }

}