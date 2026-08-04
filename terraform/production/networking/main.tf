############################################################
# Project Crystal
# Production Networking
############################################################

############################################################
# Production VPC
############################################################

module "production_vpc" {

  source = "../../modules/vpc"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  tags = var.common_tags
}

############################################################
# Production Subnets
############################################################

module "production_subnets" {

  source = "../../modules/subnet"

  vpc_id = module.production_vpc.vpc_id

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  tags = var.common_tags

  kubernetes_tags = {

    "kubernetes.io/cluster/crystal-production-eks" = "shared"

    "kubernetes.io/role/elb" = "1"

    "kubernetes.io/role/internal-elb" = "1"

  }

}

############################################################
# Internet Gateway
#
# NOTE: this module block was missing from the main.tf that
# was supplied for review, even though main.tf, outputs.tf,
# and terraform.tfstate all reference
# module.production_internet_gateway. Restored here using
# the same "../../modules/internet-gateway" module and the
# same var.internet_gateway_name already present in
# variables.tf / terraform.tfvars, matching the pattern used
# in shared-services/networking. See the review notes for
# details -- this is unrelated to VPC Peering but is required
# for this stack to plan/apply at all.
############################################################

module "production_internet_gateway" {

  source = "../../modules/internet-gateway"

  vpc_id = module.production_vpc.vpc_id

  igw_name = var.internet_gateway_name

  tags = var.common_tags
}

############################################################
# Route Tables
############################################################

module "production_route_table" {

  source = "../../modules/route-table"

  vpc_id = module.production_vpc.vpc_id

  public_route_table_name  = var.public_route_table_name
  private_route_table_name = var.private_route_table_name

  internet_gateway_id = module.production_internet_gateway.igw_id

  public_subnet_ids = values(module.production_subnets.public_subnet_ids)

  private_subnet_ids = values(module.production_subnets.private_subnet_ids)

  tags = var.common_tags
}

############################################################
# Bastion Security Group
############################################################

module "bastion_security_group" {

  source = "../../modules/security-group"

  vpc_id = module.production_vpc.vpc_id

  security_group_name = var.bastion_security_group_name

  allowed_ssh_cidrs = var.allowed_ssh_cidrs

  tags = var.common_tags
}

############################################################
# NAT Gateway
############################################################

module "production_nat_gateway" {

  source = "../../modules/nat-gateway"

  nat_gateway_name = var.nat_gateway_name

  elastic_ip_name = var.elastic_ip_name

  public_subnet_id = module.production_subnets.public_subnet_ids[
    var.nat_gateway_public_subnet_name
  ]

  private_route_table_id = module.production_route_table.private_route_table_id

  tags = var.common_tags

  depends_on = [
    module.production_internet_gateway,
    module.production_route_table
  ]
}

############################################################
# VPC Peering (Production <-> Shared Services)
#
# Production is the ACCEPTER side. The Shared Services stack
# creates the requester side and outputs the pending
# vpc_peering_connection_id, which is copied into this
# stack's terraform.tfvars (var.vpc_peering_connection_id)
# after that stack has been applied. See the review notes for
# the required apply order.
############################################################

module "vpc_peering" {

  source = "../../modules/vpc-peering"

  create_accepter = true

  vpc_peering_connection_id = var.vpc_peering_connection_id

  peering_connection_name = var.vpc_peering_connection_name

  public_route_table_id  = module.production_route_table.public_route_table_id
  private_route_table_id = module.production_route_table.private_route_table_id

  destination_cidr_block = var.shared_services_vpc_cidr

  tags = var.common_tags
}