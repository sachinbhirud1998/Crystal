############################################################
# Project Crystal
# Module      : NAT Gateway
############################################################

############################################################
# Elastic IP
############################################################

resource "aws_eip" "this" {

  domain = "vpc"

  tags = merge(

    var.tags,

    {

      Name = var.elastic_ip_name

    }

  )

}

############################################################
# NAT Gateway
############################################################

resource "aws_nat_gateway" "this" {

  allocation_id = aws_eip.this.id

  subnet_id = var.public_subnet_id

  connectivity_type = "public"

  tags = merge(

    var.tags,

    {

      Name = var.nat_gateway_name

    }

  )

}

############################################################
# Default Route for Private Route Table
############################################################

resource "aws_route" "private_default_route" {

  route_table_id = var.private_route_table_id

  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = aws_nat_gateway.this.id

}