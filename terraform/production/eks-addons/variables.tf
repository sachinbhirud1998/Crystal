############################################################
# Project Crystal
# Production EKS Add-ons
############################################################

############################################################
# AWS Configuration
############################################################

variable "aws_region" {

  description = "AWS Region"

  type = string

}


############################################################
# Common Tags
############################################################

variable "common_tags" {

  description = "Common Resource Tags"

  type = map(string)

}