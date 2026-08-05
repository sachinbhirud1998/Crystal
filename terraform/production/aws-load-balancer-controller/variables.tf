############################################################
# Project Crystal
# Production AWS Load Balancer Controller
############################################################

############################################################
# AWS
############################################################

variable "aws_region" {

  description = "AWS Region"

  type = string

}


############################################################
# Helm
############################################################

variable "chart_version" {

  description = "AWS Load Balancer Controller Helm Chart Version"

  type = string

}

############################################################
# Common Tags
############################################################

variable "common_tags" {

  description = "Common Resource Tags"

  type = map(string)

}
