############################################################
# Project Crystal
# Production EKS Managed Node Group
############################################################

############################################################
# AWS Configuration
############################################################

aws_region = "ap-south-1"

aws_profile = "production"

############################################################
# Node Group
############################################################

node_group_name = "crystal-production-node-group"

############################################################
# IAM
############################################################

node_role_name = "crystal-production-node-role"

############################################################
# Networking
############################################################

private_subnet_names = [

  "crystal-prod-private-subnet-a",

  "crystal-prod-private-subnet-b"

]

############################################################
# EC2 Configuration
############################################################

instance_types = [

  "t3.medium"

]

capacity_type = "ON_DEMAND"

ami_type = "AL2023_x86_64_STANDARD"

disk_size = 20

############################################################
# Scaling Configuration
############################################################

desired_size = 2

min_size = 2

max_size = 2

############################################################
# Kubernetes Labels
############################################################

labels = {

  Environment = "Production"

  NodeGroup = "Primary"

}

############################################################
# Common Tags
############################################################

common_tags = {

  Project = "Crystal"

  Environment = "Production"

  ManagedBy = "Terraform"

}