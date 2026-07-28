############################################################
# Project Crystal
# Shared Services Networking
############################################################

############################################################
# VPC
############################################################

module "shared_services_vpc" {

  source = "../../modules/vpc"

  vpc_name = var.vpc_name

  vpc_cidr = var.vpc_cidr

  tags = var.common_tags

}

############################################################
# SUBNETS
############################################################

module "shared_services_subnets" {

  source = "../../modules/subnet"

  vpc_id = module.shared_services_vpc.vpc_id

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets

  tags = var.common_tags

}