############################################################
# Project Crystal
# Production Networking
############################################################

############################################################
# AWS Configuration
############################################################

aws_region = "ap-south-1"

aws_profile = "production"

############################################################
# VPC
############################################################

vpc_name = "crystal-production-vpc"

vpc_cidr = "10.2.0.0/16"

############################################################
# Internet Gateway
############################################################

internet_gateway_name = "crystal-production-igw"

############################################################
# Route Table
############################################################

public_route_table_name = "crystal-prod-public-route-table"

private_route_table_name = "crystal-prod-private-route-table"

############################################################
# Network ACL
############################################################

public_network_acl_name = "crystal-production-public-network-acl"

private_network_acl_name = "crystal-production-private-network-acl"

############################################################
# Security Group
############################################################

bastion_security_group_name = "crystal-production-bastion-security-group"

############################################################
# Public Subnets
############################################################

public_subnets = {

  crystal-prod-public-subnet-a = {

    cidr = "10.2.1.0/24"

    az = "ap-south-1a"

  }

  crystal-prod-public-subnet-b = {

    cidr = "10.2.2.0/24"

    az = "ap-south-1b"

  }

}

############################################################
# Private Subnets
############################################################

private_subnets = {

  crystal-prod-private-subnet-a = {

    cidr = "10.2.11.0/24"

    az = "ap-south-1a"

  }

  crystal-prod-private-subnet-b = {

    cidr = "10.2.12.0/24"

    az = "ap-south-1b"

  }

}

############################################################
# SSH Access
############################################################

allowed_ssh_cidrs = [

  "103.235.0.227/32",

  "103.195.202.202/32"

]

############################################################
# Common Tags
############################################################

common_tags = {

  Project = "Crystal"

  Environment = "Production"

  ManagedBy = "Terraform"

}

############################################################
# NAT Gateway
############################################################

nat_gateway_name = "crystal-production-nat-gateway"

elastic_ip_name = "crystal-production-nat-eip"

nat_gateway_public_subnet_name = "crystal-prod-public-subnet-a"