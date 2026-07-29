############################################################
# Public Network ACL
############################################################

resource "aws_network_acl" "public" {

  vpc_id = var.vpc_id

  subnet_ids = var.public_subnet_ids

  tags = merge(
    var.tags,
    {
      Name = var.public_network_acl_name
    }
  )
}

############################################################
# Public Ingress - HTTP
############################################################

resource "aws_network_acl_rule" "public_http_ingress" {

  network_acl_id = aws_network_acl.public.id

  rule_number = 100

  egress = false

  protocol = "tcp"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 80
  to_port   = 80
}

############################################################
# Public Ingress - HTTPS
############################################################

resource "aws_network_acl_rule" "public_https_ingress" {

  network_acl_id = aws_network_acl.public.id

  rule_number = 110

  egress = false

  protocol = "tcp"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 443
  to_port   = 443
}

############################################################
# Public Ingress - SSH
############################################################

resource "aws_network_acl_rule" "public_ssh_ingress" {

  network_acl_id = aws_network_acl.public.id

  rule_number = 120

  egress = false

  protocol = "tcp"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 22
  to_port   = 22
}

############################################################
# Public Ingress - Ephemeral
############################################################

resource "aws_network_acl_rule" "public_ephemeral_ingress" {

  network_acl_id = aws_network_acl.public.id

  rule_number = 130

  egress = false

  protocol = "tcp"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 1024
  to_port   = 65535
}

############################################################
# Public Egress
############################################################

resource "aws_network_acl_rule" "public_egress" {

  network_acl_id = aws_network_acl.public.id

  rule_number = 100

  egress = true

  protocol = "-1"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 0
  to_port   = 0
}

############################################################
# Private Network ACL
############################################################

resource "aws_network_acl" "private" {

  vpc_id = var.vpc_id

  subnet_ids = var.private_subnet_ids

  tags = merge(
    var.tags,
    {
      Name = var.private_network_acl_name
    }
  )
}

############################################################
# Private Ingress - VPC Traffic
############################################################

resource "aws_network_acl_rule" "private_vpc_ingress" {

  network_acl_id = aws_network_acl.private.id

  rule_number = 100

  egress = false

  protocol = "-1"

  rule_action = "allow"

  cidr_block = var.vpc_cidr

  from_port = 0
  to_port   = 0
}

############################################################
# Private Ingress - Ephemeral
############################################################

resource "aws_network_acl_rule" "private_ephemeral_ingress" {

  network_acl_id = aws_network_acl.private.id

  rule_number = 110

  egress = false

  protocol = "tcp"

  rule_action = "allow"

  cidr_block = var.vpc_cidr

  from_port = 1024
  to_port   = 65535
}

############################################################
# Private Egress
############################################################

resource "aws_network_acl_rule" "private_egress" {

  network_acl_id = aws_network_acl.private.id

  rule_number = 100

  egress = true

  protocol = "-1"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 0
  to_port   = 0
}