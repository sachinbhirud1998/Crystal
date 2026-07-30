############################################################
# Project Crystal
# Module      : VPC Endpoints
############################################################

############################################################
# Current AWS Region
############################################################

data "aws_region" "current" {}

############################################################
# Interface VPC Endpoints
############################################################

resource "aws_vpc_endpoint" "interface" {

  for_each = var.interface_endpoints

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${data.aws_region.current.name}.${each.value.service}"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = var.security_group_ids

  private_dns_enabled = each.value.private_dns_enabled

  tags = merge(

    var.tags,

    {

      Name = each.key

    }

  )

}

############################################################
# Gateway VPC Endpoints
############################################################

resource "aws_vpc_endpoint" "gateway" {

  for_each = var.gateway_endpoints

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${data.aws_region.current.name}.${each.value.service}"

  vpc_endpoint_type = "Gateway"

  route_table_ids = var.route_table_ids

  tags = merge(

    var.tags,

    {

      Name = each.key

    }

  )

}