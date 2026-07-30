############################################################
# Project Crystal
# Module      : EKS Cluster
############################################################

############################################################
# Cluster
############################################################

output "cluster_name" {

  description = "Amazon EKS Cluster Name"

  value = aws_eks_cluster.this.name

}

output "cluster_arn" {

  description = "Amazon EKS Cluster ARN"

  value = aws_eks_cluster.this.arn

}

output "cluster_id" {

  description = "Amazon EKS Cluster ID"

  value = aws_eks_cluster.this.id

}

output "cluster_version" {

  description = "Kubernetes Version"

  value = aws_eks_cluster.this.version

}

output "cluster_status" {

  description = "Cluster Status"

  value = aws_eks_cluster.this.status

}

############################################################
# API Endpoint
############################################################

output "cluster_endpoint" {

  description = "Kubernetes API Server Endpoint"

  value = aws_eks_cluster.this.endpoint

}

output "cluster_certificate_authority_data" {

  description = "Cluster Certificate Authority Data"

  value = aws_eks_cluster.this.certificate_authority[0].data

  sensitive = true

}

############################################################
# OIDC
############################################################

output "cluster_oidc_issuer_url" {

  description = "OIDC Issuer URL"

  value = aws_eks_cluster.this.identity[0].oidc[0].issuer

}

############################################################
# Networking
############################################################

output "cluster_security_group_id" {

  description = "Cluster Security Group"

  value = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id

}

############################################################
# Platform
############################################################

output "platform_version" {

  description = "Amazon EKS Platform Version"

  value = aws_eks_cluster.this.platform_version

}