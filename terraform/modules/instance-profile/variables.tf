############################################################
# Project Crystal
# Module: IAM Instance Profile
############################################################

############################################################
# Instance Profile
############################################################

variable "instance_profile_name" {
  description = "IAM Instance Profile name"
  type        = string
}

############################################################
# IAM Role
############################################################

variable "role_name" {
  description = "IAM Role to associate with the Instance Profile"
  type        = string
}

############################################################
# Tags
############################################################

variable "tags" {
  description = "Common resource tags"
  type        = map(string)

  default = {}
}