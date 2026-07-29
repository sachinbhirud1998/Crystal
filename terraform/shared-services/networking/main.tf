############################################################
# Project Crystal
# Shared Services Networking
#
# Milestone 2
#
# Resources
#   - VPC
#   - Public Subnets
#   - Private Subnets
#   - Internet Gateway
#   - Public Route Table
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

  igw_name = "crystal-shared-services-igw"

  tags = var.common_tags
}

############################################################
# Shared Services Public Route Table
############################################################

module "shared_services_route_table" {

  source = "../../modules/route-table"

  vpc_id = module.shared_services_vpc.vpc_id

  route_table_name = "crystal-public-route-table"

  internet_gateway_id = module.shared_services_igw.igw_id

  public_subnet_ids = values(module.shared_services_subnets.public_subnet_ids)

  tags = var.common_tags
}

############################################################
# Management Security Group
############################################################

module "management_security_group" {

  source = "../../modules/security-group"

  vpc_id = module.shared_services_vpc.vpc_id

  security_group_name = "crystal-management-sg"

  allowed_ssh_cidrs = var.allowed_ssh_cidrs

  tags = {
    Project     = "Crystal"
    Environment = "shared-services"
    ManagedBy   = "Terraform"
  }
}

############################################################
# Shared Services Network ACL
############################################################

module "shared_services_network_acl" {

  source = "../../modules/network-acl"

  vpc_id   = module.shared_services_vpc.vpc_id
  vpc_cidr = var.vpc_cidr

  public_network_acl_name  = "crystal-public-network-acl"
  private_network_acl_name = "crystal-private-network-acl"

  public_subnet_ids = values(
    module.shared_services_subnets.public_subnet_ids
  )

  private_subnet_ids = values(
    module.shared_services_subnets.private_subnet_ids
  )

  tags = var.common_tags
}