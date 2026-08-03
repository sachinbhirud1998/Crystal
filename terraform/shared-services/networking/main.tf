############################################################
# Project Crystal
# Shared Services Networking
############################################################

############################################################
# Shared Services VPC
############################################################

module "shared_services_vpc" {

  source = "../../modules/vpc"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  tags = var.common_tags
}

############################################################
# Shared Services Subnets
############################################################

module "shared_services_subnets" {

  source = "../../modules/subnet"

  vpc_id = module.shared_services_vpc.vpc_id

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  tags = var.common_tags

}

############################################################
# Shared Services Internet Gateway
############################################################

module "shared_services_igw" {

  source = "../../modules/internet-gateway"

  vpc_id = module.shared_services_vpc.vpc_id

  igw_name = var.internet_gateway_name

  tags = var.common_tags
}

############################################################
# Shared Services Route Tables
############################################################

module "shared_services_route_table" {

  source = "../../modules/route-table"

  vpc_id = module.shared_services_vpc.vpc_id

  public_route_table_name  = var.public_route_table_name
  private_route_table_name = var.private_route_table_name

  internet_gateway_id = module.shared_services_igw.igw_id

  public_subnet_ids  = values(module.shared_services_subnets.public_subnet_ids)
  private_subnet_ids = values(module.shared_services_subnets.private_subnet_ids)

  tags = var.common_tags
}

############################################################
# Management Security Group
############################################################

module "management_security_group" {

  source = "../../modules/security-group"

  vpc_id = module.shared_services_vpc.vpc_id

  security_group_name = var.management_security_group_name

  allowed_ssh_cidrs = var.allowed_ssh_cidrs

  tags = var.common_tags
}

############################################################
# VPC Peering (Shared Services <-> Production)
#
# Shared Services is the REQUESTER side. Apply this stack
# first, then copy the vpc_peering_connection_id output into
# production/networking/terraform.tfvars so that stack can
# accept the connection. See the review notes for the full
# apply order.
############################################################

module "vpc_peering" {

  source = "../../modules/vpc-peering"

  create_requester = true

  vpc_id = module.shared_services_vpc.vpc_id

  peer_vpc_id   = var.production_vpc_id
  peer_owner_id = var.production_account_id

  peering_connection_name = var.vpc_peering_connection_name

  # No private_route_table_id: Shared Services has no private
  # subnets, so the private route table has no associations
  # and doesn't need a peering route.
  public_route_table_id = module.shared_services_route_table.public_route_table_id

  destination_cidr_block = var.production_vpc_cidr

  tags = var.common_tags
}
