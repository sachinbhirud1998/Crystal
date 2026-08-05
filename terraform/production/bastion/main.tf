############################################################
# Project Crystal
# Production Bastion
############################################################

############################################################
# Production Networking Remote State
############################################################

data "terraform_remote_state" "networking" {

  backend = "s3"

  config = {

    bucket = "crystal-tfstate-987654321"

    key = "production/networking/terraform.tfstate"

    region = "ap-south-1"

    profile = "shared-services"

  }

}

############################################################
# IAM Role
############################################################

module "bastion_iam_role" {

  source = "../../modules/iam-role"

  role_name = var.iam_role_name

  role_description = "IAM Role for Project Crystal Production Bastion"

  service_principal = "ec2.amazonaws.com"

  managed_policy_arns = [

    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

  ]

  tags = var.common_tags

}

############################################################
# Bastion EKS Access Policy
############################################################

resource "aws_iam_role_policy" "bastion_eks_access" {

  name = "crystal-production-bastion-eks-access"

  role = module.bastion_iam_role.role_name

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid = "EKSRead"

        Effect = "Allow"

        Action = [

          "eks:DescribeCluster",
          "eks:ListClusters"

        ]

        Resource = "*"

      },

      {

        Sid = "STSRead"

        Effect = "Allow"

        Action = [

          "sts:GetCallerIdentity"

        ]

        Resource = "*"

      }

    ]

  })

}

############################################################
# IAM Instance Profile
############################################################

module "bastion_instance_profile" {

  source = "../../modules/instance-profile"

  instance_profile_name = var.instance_profile_name

  role_name = module.bastion_iam_role.role_name

  tags = var.common_tags

}

############################################################
# Key Pair
############################################################

module "bastion_key_pair" {

  source = "../../modules/key-pair"

  key_name = var.key_name

  private_key_path = var.private_key_path

  tags = merge(

    var.common_tags,

    {

      Name = var.key_name

    }

  )

}

############################################################
# Local Values
############################################################

locals {

  bastion_subnet_id = data.terraform_remote_state.networking.outputs.public_subnet_ids[var.bastion_public_subnet_name]

  bastion_security_group_id = data.terraform_remote_state.networking.outputs.bastion_security_group_id

}

############################################################
# Production Bastion EC2
############################################################

module "production_bastion" {

  source = "../../modules/ec2"

  instance_name = var.instance_name

  instance_type = var.instance_type

  ami_id = var.ami_id

  subnet_id = local.bastion_subnet_id

  security_group_ids = [

    local.bastion_security_group_id

  ]

  associate_public_ip_address = var.associate_public_ip_address

  iam_instance_profile = module.bastion_instance_profile.instance_profile_name

  key_name = module.bastion_key_pair.key_name

  root_volume_size = var.root_volume_size

  root_volume_type = var.root_volume_type

  user_data = base64encode(<<-EOF
#!/bin/bash
set -eux

############################################################
# System Update
############################################################

dnf update -y

############################################################
# Docker
############################################################

dnf install -y docker

systemctl enable docker

systemctl start docker

usermod -aG docker ec2-user

############################################################
# AWS CLI
############################################################

dnf install -y unzip curl

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"

cd /tmp

unzip -o awscliv2.zip

./aws/install --update

############################################################
# Helm
############################################################

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

############################################################
# Amazon SSM Agent
############################################################

systemctl enable amazon-ssm-agent

systemctl restart amazon-ssm-agent

############################################################
# Validation File
############################################################

cat <<EOT >/home/ec2-user/README.txt

==========================================
Project Crystal Production Bastion
==========================================

Installed Components

- Docker
- AWS CLI
- Helm
- Amazon SSM Agent

Purpose

- Access Production EKS
- kubectl Administration
- Helm Deployments
- Application Team Operations

==========================================

EOT

chown ec2-user:ec2-user /home/ec2-user/README.txt

EOF
  )

  tags = merge(

    var.common_tags,

    {

      Name = var.instance_name

    }

  )

}