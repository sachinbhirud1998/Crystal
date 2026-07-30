############################################################
# Project Crystal
# Production Bastion
############################################################

############################################################
# AWS Configuration
############################################################

aws_region = "ap-south-1"

aws_profile = "production"

############################################################
# IAM Configuration
############################################################

iam_role_name = "crystal-production-bastion-role"

instance_profile_name = "crystal-production-bastion-instance-profile"

############################################################
# EC2 Configuration
############################################################

instance_name = "crystal-production-bastion"

instance_type = "t3.medium"

ami_id = "ami-00d2dbb426772b03a"

associate_public_ip_address = true

############################################################
# Root Volume
############################################################

root_volume_size = 30

root_volume_type = "gp3"

############################################################
# Networking
############################################################

bastion_public_subnet_name = "crystal-prod-public-subnet-a"

############################################################
# SSH Key Pair
############################################################

key_name = "crystal-production-bastion-key"

private_key_path = "../../../keys/crystal-production-bastion.pem"

############################################################
# Common Tags
############################################################

common_tags = {

  Project = "Crystal"

  Environment = "Production"

  ManagedBy = "Terraform"

}