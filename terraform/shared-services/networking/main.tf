module "shared_services_vpc" {

  source = "../../modules/vpc"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  tags = var.common_tags
}