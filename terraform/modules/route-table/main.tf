############################################################
# Project Crystal
# Module      : Route Table
############################################################

############################################################
# Public Route Table
############################################################

resource "aws_route_table" "public" {

  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = var.route_table_name
    }
  )
}

############################################################
# Default Internet Route
############################################################

resource "aws_route" "internet" {

  route_table_id = aws_route_table.public.id

  destination_cidr_block = "0.0.0.0/0"

  gateway_id = var.internet_gateway_id
}

############################################################
# Route Table Associations
############################################################

resource "aws_route_table_association" "public" {

  count = length(var.public_subnet_ids)

  subnet_id = var.public_subnet_ids[count.index]

  route_table_id = aws_route_table.public.id
}