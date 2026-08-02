############################################################
# Project Crystal
# Production EKS Cluster
############################################################

############################################################
# AWS Configuration
############################################################

aws_region = "ap-south-1"

aws_profile = "production"

############################################################
# EKS Cluster Configuration
############################################################

cluster_name = "crystal-production-eks"

kubernetes_version = "1.34"

############################################################
# IAM Configuration
############################################################

cluster_role_name = "crystal-production-eks-cluster-role"

############################################################
# Networking
############################################################

private_subnet_names = [

  "crystal-prod-private-subnet-a",

  "crystal-prod-private-subnet-b"

]

############################################################
# Kubernetes API Endpoint
############################################################

endpoint_private_access = true

endpoint_public_access = true

public_access_cidrs = [

  "45.127.44.82/32",

  "103.235.0.227/32"

]

############################################################
# Control Plane Logging
############################################################

enabled_cluster_log_types = []

############################################################
# Common Tags
############################################################

common_tags = {

  Project = "Crystal"

  Environment = "Production"

  ManagedBy = "Terraform"

}