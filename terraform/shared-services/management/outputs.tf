############################################################
# Project Crystal
# Shared Services - Management
############################################################

############################################################
# IAM Role
############################################################

output "iam_role_name" {

  description = "Management IAM Role Name"

  value = module.management_iam_role.role_name

}

output "iam_role_arn" {

  description = "Management IAM Role ARN"

  value = module.management_iam_role.role_arn

}

############################################################
# IAM Instance Profile
############################################################

output "instance_profile_name" {

  description = "Management Instance Profile Name"

  value = module.management_instance_profile.instance_profile_name

}

output "instance_profile_arn" {

  description = "Management Instance Profile ARN"

  value = module.management_instance_profile.instance_profile_arn

}

############################################################
# Remote State Outputs
############################################################

output "management_subnet_id" {

  description = "Management Subnet ID"

  value = local.management_subnet_id

}

output "management_security_group_id" {

  description = "Management Security Group ID"

  value = local.management_security_group_id

}