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

instance_name = "crystal-management"

instance_type = "t3.medium"

root_volume_size = 30

root_volume_type = "gp3"

associate_public_ip_address = true

############################################################
# SSH
############################################################

key_name = "YOUR_KEY_PAIR_NAME"

############################################################
# Common Tags
############################################################

common_tags = {

  Project = "Crystal"

  Environment = "SharedServices"

  ManagedBy = "Terraform"

}

############################################################
# Subnet
############################################################

management_public_subnet_name = "crystal-public-subnet-a"