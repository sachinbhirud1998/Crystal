############################################################
# Project Crystal
# Module      : EKS Node Group
############################################################

############################################################
# Node Group
############################################################

output "node_group_name" {

  description = "Amazon EKS Managed Node Group Name"

  value = aws_eks_node_group.this.node_group_name

}

output "node_group_arn" {

  description = "Amazon EKS Managed Node Group ARN"

  value = aws_eks_node_group.this.arn

}

output "node_group_id" {

  description = "Amazon EKS Managed Node Group ID"

  value = aws_eks_node_group.this.id

}

output "node_group_status" {

  description = "Amazon EKS Managed Node Group Status"

  value = aws_eks_node_group.this.status

}

############################################################
# Scaling
############################################################

output "desired_size" {

  description = "Desired Worker Node Count"

  value = aws_eks_node_group.this.scaling_config[0].desired_size

}

output "min_size" {

  description = "Minimum Worker Node Count"

  value = aws_eks_node_group.this.scaling_config[0].min_size

}

output "max_size" {

  description = "Maximum Worker Node Count"

  value = aws_eks_node_group.this.scaling_config[0].max_size

}

############################################################
# Capacity
############################################################

output "capacity_type" {

  description = "Capacity Type"

  value = aws_eks_node_group.this.capacity_type

}

output "ami_type" {

  description = "AMI Type"

  value = aws_eks_node_group.this.ami_type

}

output "instance_types" {

  description = "EC2 Instance Types"

  value = aws_eks_node_group.this.instance_types

}

############################################################
# Version
############################################################

output "release_version" {

  description = "EKS Optimized AMI Release Version"

  value = aws_eks_node_group.this.release_version

}

output "node_group_version" {

  description = "Kubernetes Version"

  value = aws_eks_node_group.this.version

}