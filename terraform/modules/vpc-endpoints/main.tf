############################################################
# Project Crystal
# VPC Endpoints Module
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

  vpc_id            = var.vpc_id
  vpc_endpoint_type = "Interface"

  service_name = "com.amazonaws.${data.aws_region.current.region}.${each.value.service}"

  subnet_ids = var.private_subnet_ids

  security_group_ids = var.security_group_ids

  private_dns_enabled = each.value.private_dns_enabled

  auto_accept = true

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

  vpc_id            = var.vpc_id
  vpc_endpoint_type = "Gateway"

  service_name = "com.amazonaws.${data.aws_region.current.region}.${each.value.service}"

  route_table_ids = var.route_table_ids

  auto_accept = true

  tags = merge(
    var.tags,
    {
      Name = each.key
    }
  )

}