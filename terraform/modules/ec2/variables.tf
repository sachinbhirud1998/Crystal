############################################################
# Project Crystal
# EC2 Module
############################################################

############################################################
# Instance Configuration
############################################################

variable "instance_name" {

  description = "EC2 Instance Name"

  type = string

}

variable "instance_type" {

  description = "EC2 Instance Type"

  type = string

}

############################################################
# AMI
############################################################

variable "ami_id" {

  description = "Amazon Machine Image ID"

  type = string

}

############################################################
# Networking
############################################################

variable "subnet_id" {

  description = "Subnet ID"

  type = string

}

variable "security_group_ids" {

  description = "Security Group IDs"

  type = list(string)

}

variable "associate_public_ip_address" {

  description = "Assign Public IP"

  type    = bool
  default = true

}

############################################################
# IAM
############################################################

variable "iam_instance_profile" {

  description = "IAM Instance Profile"

  type = string

}

############################################################
# SSH
############################################################

variable "key_name" {

  description = "EC2 Key Pair"

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

  type    = string
  default = "gp3"

}

variable "delete_on_termination" {

  description = "Delete Root Volume on Termination"

  type    = bool
  default = true

}

variable "encrypted" {

  description = "Encrypt Root Volume"

  type    = bool
  default = true

}

############################################################
# Instance Metadata Service (IMDS)
############################################################

variable "http_tokens" {

  description = "IMDSv2 Token Requirement"

  type    = string
  default = "required"

}

variable "http_endpoint" {

  description = "Enable Instance Metadata Service"

  type    = string
  default = "enabled"

}

############################################################
# Monitoring
############################################################

variable "enable_detailed_monitoring" {

  description = "Enable EC2 Detailed Monitoring"

  type    = bool
  default = false

}

############################################################
# User Data
############################################################

variable "user_data" {

  description = "Cloud-init/User Data"

  type    = string
  default = ""

}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Tags"

  type = map(string)

}