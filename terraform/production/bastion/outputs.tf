############################################################
# Project Crystal
# Production Bastion
############################################################

############################################################
# IAM Role
############################################################

output "iam_role_name" {

  description = "IAM Role Name"

  value = module.bastion_iam_role.role_name

}

output "iam_role_arn" {

  description = "IAM Role ARN"

  value = module.bastion_iam_role.role_arn

}

############################################################
# IAM Instance Profile
############################################################

output "instance_profile_name" {

  description = "IAM Instance Profile Name"

  value = module.bastion_instance_profile.instance_profile_name

}

output "instance_profile_arn" {

  description = "IAM Instance Profile ARN"

  value = module.bastion_instance_profile.instance_profile_arn

}

############################################################
# Key Pair
############################################################

output "key_name" {

  description = "Key Pair Name"

  value = module.bastion_key_pair.key_name

}

output "key_pair_id" {

  description = "Key Pair ID"

  value = module.bastion_key_pair.key_pair_id

}

output "key_fingerprint" {

  description = "Key Fingerprint"

  value = module.bastion_key_pair.fingerprint

}

output "private_key_file" {

  description = "Private Key File"

  value = module.bastion_key_pair.private_key_file

}

############################################################
# Networking
############################################################

output "bastion_subnet_id" {

  description = "Bastion Subnet ID"

  value = local.bastion_subnet_id

}

output "bastion_security_group_id" {

  description = "Bastion Security Group ID"

  value = local.bastion_security_group_id

}

############################################################
# EC2
############################################################

output "instance_id" {

  description = "EC2 Instance ID"

  value = module.production_bastion.instance_id

}

output "instance_arn" {

  description = "EC2 Instance ARN"

  value = module.production_bastion.instance_arn

}

output "instance_private_ip" {

  description = "Private IP"

  value = module.production_bastion.instance_private_ip

}

output "instance_public_ip" {

  description = "Public IP"

  value = module.production_bastion.instance_public_ip

}

output "instance_private_dns" {

  description = "Private DNS"

  value = module.production_bastion.instance_private_dns

}

output "instance_public_dns" {

  description = "Public DNS"

  value = module.production_bastion.instance_public_dns

}

output "availability_zone" {

  description = "Availability Zone"

  value = module.production_bastion.availability_zone

}