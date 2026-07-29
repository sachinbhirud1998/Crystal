############################################################
# Project Crystal
# Shared Services - Management
############################################################

############################################################
# Networking Remote State
############################################################

data "terraform_remote_state" "networking" {

  backend = "local"

  config = {
    path = "../networking/terraform.tfstate"
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