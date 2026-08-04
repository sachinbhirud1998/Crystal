############################################################
# Project Crystal
# Reusable Subnet Module
############################################################

############################################################
# Public Subnets
############################################################

resource "aws_subnet" "public" {

  for_each = var.public_subnets

  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = merge(

    var.tags,

    {

      Name = each.key

      Type = "Public"

    },

    var.public_kubernetes_tags

  )

}

############################################################
# Private Subnets
############################################################

resource "aws_subnet" "private" {

  for_each = var.private_subnets

  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = merge(

    var.tags,

    {

      Name = each.key

      Type = "Private"

    },

    var.private_kubernetes_tags

  )

}
