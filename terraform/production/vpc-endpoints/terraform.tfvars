############################################################
# Project Crystal
# Production VPC Endpoints
############################################################

############################################################
# AWS Configuration
############################################################

aws_region = "ap-south-1"

aws_profile = "production"

############################################################
# Security Group
############################################################

endpoint_security_group_name = "crystal-production-vpc-endpoints-sg"

############################################################
# Interface Endpoints
############################################################

interface_endpoints = {

  ecr-api = {

    service = "ecr.api"

    private_dns_enabled = true

  }

  ecr-dkr = {

    service = "ecr.dkr"

    private_dns_enabled = true

  }

  ec2 = {

    service = "ec2"

    private_dns_enabled = true

  }

  sts = {

    service = "sts"

    private_dns_enabled = true

  }

  ssm = {

    service = "ssm"

    private_dns_enabled = true

  }

  ec2messages = {

    service = "ec2messages"

    private_dns_enabled = true

  }

  ssmmessages = {

    service = "ssmmessages"

    private_dns_enabled = true

  }

}

############################################################
# Gateway Endpoints
############################################################

gateway_endpoints = {

  s3 = {

    service = "s3"

  }

}

############################################################
# Common Tags
############################################################

common_tags = {

  Project = "Crystal"

  Environment = "Production"

  ManagedBy = "Terraform"

}
