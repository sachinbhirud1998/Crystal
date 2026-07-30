############################################################
# Project Crystal
# Production Bastion
############################################################

############################################################
# AWS Configuration
############################################################

variable "aws_region" {

  description = "AWS Region"

  type = string

}

variable "aws_profile" {

  description = "AWS CLI Profile"

  type = string

}

############################################################
# IAM
############################################################

variable "iam_role_name" {

  description = "IAM Role Name"

  type = string

}

variable "instance_profile_name" {

  description = "IAM Instance Profile Name"

  type = string

}

############################################################
# EC2 Configuration
############################################################

variable "instance_name" {

  description = "Bastion EC2 Instance Name"

  type = string

}

variable "instance_type" {

  description = "EC2 Instance Type"

  type = string

}

variable "ami_id" {

  description = "Amazon Linux 2023 AMI"

  type = string

}

############################################################
# Root Volume
############################################################

variable "root_volume_size" {

  description = "Root Volume Size (GB)"

  type = number

}

variable "root_volume_type" {

  description = "Root Volume Type"

  type = string

  default = "gp3"

}

############################################################
# Networking
############################################################

variable "associate_public_ip_address" {

  description = "Assign Public IP"

  type = bool

  default = true

}

variable "bastion_public_subnet_name" {

  description = "Public Subnet Name"

  type = string

}

############################################################
# SSH
############################################################

variable "key_name" {

  description = "EC2 Key Pair Name"

  type = string

}

variable "private_key_path" {

  description = "Private Key Location"

  type = string

}

############################################################
# Common Tags
############################################################

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

}