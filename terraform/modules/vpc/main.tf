############################################################
# Project Crystal
# Milestone 2.1
#
# Creates ONLY the Shared Services VPC.
#
# No Internet Gateway
# No NAT Gateway
# No Subnets
#
# Those will be created in later milestones.
############################################################

resource "aws_vpc" "this" {

  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    var.tags,
    {
      Name = var.vpc_name
    }
  )
}