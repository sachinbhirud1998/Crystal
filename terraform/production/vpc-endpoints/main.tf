############################################################
# Project Crystal
# Production VPC Endpoints
############################################################

############################################################
# Production Networking Remote State
############################################################

data "terraform_remote_state" "networking" {

  backend = "local"

  config = {

    path = "../networking/terraform.tfstate"

  }

}

############################################################
# Local Values
############################################################

locals {

  vpc_id = data.terraform_remote_state.networking.outputs.vpc_id

  vpc_cidr = data.terraform_remote_state.networking.outputs.vpc_cidr

  private_subnet_ids = values(

    data.terraform_remote_state.networking.outputs.private_subnet_ids

  )

  private_route_table_ids = [

    data.terraform_remote_state.networking.outputs.private_route_table_id

  ]

}

############################################################
# Endpoint Security Group
############################################################

resource "aws_security_group" "vpc_endpoints" {

  name = var.endpoint_security_group_name

  description = "Security Group for VPC Interface Endpoints"

  vpc_id = local.vpc_id

  ingress {

    description = "HTTPS from VPC"

    from_port = 443

    to_port = 443

    protocol = "tcp"

    cidr_blocks = [

      local.vpc_cidr

    ]

  }

  egress {

    description = "Allow all outbound traffic"

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [

      "0.0.0.0/0"

    ]

  }

  tags = merge(

    var.common_tags,

    {

      Name = var.endpoint_security_group_name

    }

  )

}

############################################################
# Production VPC Endpoints
############################################################

module "production_vpc_endpoints" {

  source = "../../modules/vpc-endpoints"

  vpc_id = local.vpc_id

  private_subnet_ids = local.private_subnet_ids

  route_table_ids = local.private_route_table_ids

  security_group_ids = [

    aws_security_group.vpc_endpoints.id

  ]

  interface_endpoints = var.interface_endpoints

  gateway_endpoints = var.gateway_endpoints

  tags = var.common_tags

}