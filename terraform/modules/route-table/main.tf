############################################################
# Project Crystal
# Module      : Route Tables
############################################################

############################################################
# Public Route Table
############################################################

resource "aws_route_table" "public" {

  vpc_id = var.vpc_id

  tags = merge(

    var.tags,

    {

      Name = var.public_route_table_name

    }

  )

}

############################################################
# Public Internet Route
############################################################

resource "aws_route" "internet" {

  route_table_id = aws_route_table.public.id

  destination_cidr_block = "0.0.0.0/0"

  gateway_id = var.internet_gateway_id

}

############################################################
# Private Route Table
############################################################

resource "aws_route_table" "private" {

  vpc_id = var.vpc_id

  tags = merge(

    var.tags,

    {

      Name = var.private_route_table_name

    }

  )

}

############################################################
# Public Associations
############################################################

resource "aws_route_table_association" "public" {

  count = length(var.public_subnet_ids)

  subnet_id = var.public_subnet_ids[count.index]

  route_table_id = aws_route_table.public.id

}

############################################################
# Private Associations
############################################################

resource "aws_route_table_association" "private" {

  count = length(var.private_subnet_ids)

  subnet_id = var.private_subnet_ids[count.index]

  route_table_id = aws_route_table.private.id

}