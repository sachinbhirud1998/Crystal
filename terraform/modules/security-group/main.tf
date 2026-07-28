############################################################
# Project Crystal
# Module: Security Group
############################################################

############################################################
# Security Group
############################################################

resource "aws_security_group" "management" {

  name        = var.security_group_name
  description = "Management Platform Security Group"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = var.security_group_name
    }
  )
}

############################################################
# SSH
############################################################

resource "aws_vpc_security_group_ingress_rule" "ssh" {

  for_each = toset(var.allowed_ssh_cidrs)

  security_group_id = aws_security_group.management.id

  cidr_ipv4 = each.value

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  description = "SSH (${each.value})"
}

############################################################
# HTTP
############################################################

resource "aws_vpc_security_group_ingress_rule" "http" {

  security_group_id = aws_security_group.management.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "HTTP"
}

############################################################
# HTTPS
############################################################

resource "aws_vpc_security_group_ingress_rule" "https" {

  security_group_id = aws_security_group.management.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  description = "HTTPS"
}

############################################################
# Outbound
############################################################

resource "aws_vpc_security_group_egress_rule" "all" {

  security_group_id = aws_security_group.management.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"

  description = "Allow all outbound traffic"
}