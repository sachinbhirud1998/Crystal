############################################################
# Project Crystal
# Shared Services - Management
############################################################

############################################################
# AWS
############################################################

aws_region = "ap-south-1"

aws_profile = "shared-services"

############################################################
# EC2
############################################################

ami_id = "ami-00d2dbb426772b03a"

instance_name = "crystal-management"

instance_type = "t3.medium"

root_volume_size = 30

root_volume_type = "gp3"

associate_public_ip_address = true

############################################################
# Network
############################################################

management_public_subnet_name = "crystal-public-subnet-a"

############################################################
# Key Pair
############################################################

key_name = "crystal-management-key"

private_key_path = "../../../keys/crystal-management.pem"

############################################################
# Common Tags
############################################################

common_tags = {

  Project = "Crystal"

  Environment = "SharedServices"

  ManagedBy = "Terraform"

}