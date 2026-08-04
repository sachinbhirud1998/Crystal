############################################################
# Project Crystal
# Shared Services - Management
############################################################

############################################################
# Networking Remote State
############################################################

data "terraform_remote_state" "networking" {

  backend = "s3"

  config = {

    bucket  = "crystal-tfstate-987654321"

    key     = "shared-services/networking/terraform.tfstate"

    region  = "ap-south-1"

    profile = "shared-services"

  }

}

############################################################
# IAM Role
############################################################

module "management_iam_role" {

  source = "../../modules/iam-role"

  role_name = "crystal-management-role"

  role_description = "IAM Role for Project Crystal Management Server"

  service_principal = "ec2.amazonaws.com"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]

  tags = var.common_tags

}

############################################################
# IAM Instance Profile
############################################################

module "management_instance_profile" {

  source = "../../modules/instance-profile"

  instance_profile_name = "crystal-management-instance-profile"

  role_name = module.management_iam_role.role_name

  tags = var.common_tags

}

############################################################
# Local Values
############################################################

locals {

  management_subnet_id = data.terraform_remote_state.networking.outputs.public_subnet_ids[var.management_public_subnet_name]

  management_security_group_id = data.terraform_remote_state.networking.outputs.management_security_group_id

}

############################################################
# Management Key Pair
############################################################

module "management_key_pair" {

  source = "../../modules/key-pair"

  key_name = var.key_name

  private_key_path = var.private_key_path

  tags = {

    Name        = var.key_name
    Project     = "Crystal"
    Environment = "SharedServices"
    ManagedBy   = "Terraform"

  }

}

############################################################
# Management EC2 Instance
############################################################

module "management_ec2" {

  source = "../../modules/ec2"

  instance_name = var.instance_name

  ami_id = var.ami_id

  instance_type = var.instance_type

  subnet_id = local.management_subnet_id

  security_group_ids = [
    local.management_security_group_id
  ]

  associate_public_ip_address = var.associate_public_ip_address

  iam_instance_profile = module.management_instance_profile.instance_profile_name

  key_name = module.management_key_pair.key_name

  root_volume_size = var.root_volume_size

  root_volume_type = var.root_volume_type

  tags = var.common_tags

}