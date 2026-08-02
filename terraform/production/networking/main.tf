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
}

############################################################
# Internet Gateway
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