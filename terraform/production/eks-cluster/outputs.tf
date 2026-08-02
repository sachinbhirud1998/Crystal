############################################################
# Project Crystal
# Production EKS Cluster
############################################################

############################################################
# IAM Role
############################################################

output "cluster_role_name" {

  description = "EKS Cluster IAM Role Name"

  value = module.eks_cluster_iam_role.role_name

}

output "cluster_role_arn" {

  description = "EKS Cluster IAM Role ARN"

  value = module.eks_cluster_iam_role.role_arn

}

############################################################
# Amazon EKS Cluster
############################################################

output "cluster_name" {

  description = "Amazon EKS Cluster Name"

  value = module.production_eks_cluster.cluster_name

}

output "cluster_id" {

  description = "Amazon EKS Cluster ID"

  value = module.production_eks_cluster.cluster_id

}

output "cluster_arn" {

  description = "Amazon EKS Cluster ARN"

  value = module.production_eks_cluster.cluster_arn

}

output "cluster_version" {

  description = "Kubernetes Version"

  value = module.production_eks_cluster.cluster_version

}

output "cluster_status" {

  description = "Amazon EKS Cluster Status"

  value = module.production_eks_cluster.cluster_status

}

############################################################
# Kubernetes API
############################################################

output "cluster_endpoint" {

  description = "Kubernetes API Endpoint"

  value = module.production_eks_cluster.cluster_endpoint

}

output "cluster_certificate_authority_data" {

  description = "Cluster Certificate Authority Data"

  value = module.production_eks_cluster.cluster_certificate_authority_data

  sensitive = true

}

############################################################
# OIDC
############################################################

output "cluster_oidc_issuer_url" {

  description = "Cluster OIDC Issuer URL"

  value = module.production_eks_cluster.cluster_oidc_issuer_url

}

############################################################
# Networking
############################################################

output "cluster_security_group_id" {

  description = "Cluster Security Group ID"

  value = module.production_eks_cluster.cluster_security_group_id

}

############################################################
# Platform
############################################################

output "platform_version" {

  description = "Amazon EKS Platform Version"

  value = module.production_eks_cluster.platform_version

}

############################################################
# IAM OIDC Provider
############################################################

output "oidc_provider_arn" {

  description = "IAM OIDC Provider ARN"

  value = module.production_eks_cluster.oidc_provider_arn

}

output "oidc_provider_url" {

  description = "IAM OIDC Provider URL"

  value = module.production_eks_cluster.oidc_provider_url

}