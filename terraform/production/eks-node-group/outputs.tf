############################################################
# Project Crystal
# Production EKS Managed Node Group
############################################################

############################################################
# IAM Role
############################################################

output "node_role_name" {

  description = "Worker Node IAM Role Name"

  value = module.eks_node_role.role_name

}

output "node_role_arn" {

  description = "Worker Node IAM Role ARN"

  value = module.eks_node_role.role_arn

}

############################################################
# Managed Node Group
############################################################

output "node_group_name" {

  description = "Amazon EKS Managed Node Group Name"

  value = module.production_eks_node_group.node_group_name

}

output "node_group_id" {

  description = "Amazon EKS Managed Node Group ID"

  value = module.production_eks_node_group.node_group_id

}

output "node_group_arn" {

  description = "Amazon EKS Managed Node Group ARN"

  value = module.production_eks_node_group.node_group_arn

}

output "node_group_status" {

  description = "Amazon EKS Managed Node Group Status"

  value = module.production_eks_node_group.node_group_status

}

############################################################
# Scaling Configuration
############################################################

output "desired_size" {

  description = "Desired Worker Node Count"

  value = module.production_eks_node_group.desired_size

}

output "min_size" {

  description = "Minimum Worker Node Count"

  value = module.production_eks_node_group.min_size

}

output "max_size" {

  description = "Maximum Worker Node Count"

  value = module.production_eks_node_group.max_size

}

############################################################
# Capacity
############################################################

output "capacity_type" {

  description = "Capacity Type"

  value = module.production_eks_node_group.capacity_type

}

output "instance_types" {

  description = "EC2 Instance Types"

  value = module.production_eks_node_group.instance_types

}

output "ami_type" {

  description = "AMI Type"

  value = module.production_eks_node_group.ami_type

}

############################################################
# Kubernetes
############################################################

output "kubernetes_version" {

  description = "Kubernetes Version"

  value = module.production_eks_node_group.node_group_version

}

output "release_version" {

  description = "EKS Optimized AMI Release Version"

  value = module.production_eks_node_group.release_version

}