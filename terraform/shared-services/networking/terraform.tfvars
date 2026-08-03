############################################################
# Project Crystal
# Shared Services Networking
############################################################

############################################################
# AWS
############################################################

aws_profile = "shared-services"

aws_region = "ap-south-1"

############################################################
# VPC
############################################################

vpc_name = "crystal-shared-vpc"

vpc_cidr = "10.0.0.0/16"

############################################################
# PUBLIC SUBNETS
############################################################

public_subnets = {

  "crystal-public-subnet-a" = {

    cidr = "10.0.1.0/24"

    az = "ap-south-1a"

  }

  "crystal-public-subnet-b" = {

    cidr = "10.0.2.0/24"

    az = "ap-south-1b"

  }

}

############################################################
# PRIVATE SUBNETS
#
# Shared Services runs everything (Rancher, Argo CD,
# Teleport) on a single EC2 instance in the public subnet --
# no private subnet is needed in this account.
############################################################

private_subnets = {}

############################################################
# TAGS
############################################################

common_tags = {

  Project     = "Crystal"

  Environment = "SharedServices"

  ManagedBy   = "Terraform"

}

############################################################
# Management Security Group
############################################################

allowed_ssh_cidrs = [

  "103.235.0.227/32",

  "103.195.202.202/32"

]

############################################################
# Internet Gateway
############################################################

internet_gateway_name = "crystal-shared-services-igw"

############################################################
# Route Tables
############################################################

public_route_table_name  = "crystal-public-route-table"

private_route_table_name = "crystal-private-route-table"

############################################################
# Management Security Group
############################################################

management_security_group_name = "crystal-management-sg"

############################################################
# VPC Peering (Production)
#
# Values below come directly from the Production stack:
# production_vpc_id / production_vpc_cidr are outputs of
# production/networking (vpc_id / vpc_cidr), and
# production_account_id is the AWS Account ID of the
# "production" profile.
############################################################

production_vpc_id = "vpc-0e75815bda5198e04"

production_vpc_cidr = "10.2.0.0/16"

production_account_id = "746760141698"

vpc_peering_connection_name = "crystal-shared-services-production-peering"
