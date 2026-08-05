############################################################
# Project Crystal
# Shared Services - Management
############################################################

############################################################
# AWS Configuration
############################################################

variable "aws_region" {

  description = "AWS Region"

  type = string

}


############################################################
# EC2 Configuration
############################################################

variable "ami_id" {

  description = "Amazon Linux AMI ID"

  type = string

}

variable "instance_name" {

  description = "Management EC2 instance name"

  type = string

}

variable "instance_type" {

  description = "EC2 Instance Type"

  type = string

}

variable "root_volume_size" {

  description = "Root Volume Size"

  type = number

}

variable "root_volume_type" {

  description = "Root Volume Type"

  type    = string
  default = "gp3"

}

variable "associate_public_ip_address" {

  description = "Assign Public IP"

  type    = bool
  default = true

}

############################################################
# SSH
############################################################

variable "key_name" {

  description = "EC2 Key Pair"

  type = string

}

variable "private_key_path" {

  description = "Local path to save the generated private key"

  type = string

}

############################################################
# Common Tags
############################################################

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

}

############################################################
# Management Subnet
############################################################

variable "management_public_subnet_name" {

  description = "Public subnet name for the management server"

  type = string

}