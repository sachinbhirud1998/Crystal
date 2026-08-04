############################################################
# Project Crystal
# Module      : VPC Peering
############################################################

############################################################
# Peering Connection
############################################################

variable "peering_connection_name" {

  description = "VPC Peering Connection Name"

  type = string

}

variable "create_requester" {

  description = "Create the requester side of the VPC Peering Connection (aws_vpc_peering_connection)"

  type = bool

  default = false

}

variable "create_accepter" {

  description = "Create the accepter side of the VPC Peering Connection (aws_vpc_peering_connection_accepter)"

  type = bool

  default = false

}

############################################################
# Requester Inputs
############################################################

variable "vpc_id" {

  description = "Local VPC ID (required when create_requester = true)"

  type = string

  default = null

}

variable "peer_vpc_id" {

  description = "Peer VPC ID (required when create_requester = true)"

  type = string

  default = null

}

variable "peer_owner_id" {

  description = "AWS Account ID that owns the peer VPC (required when create_requester = true)"

  type = string

  default = null

}

variable "peer_region" {

  description = "Region of the peer VPC, only needed if it differs from this stack's region"

  type = string

  default = null

}

############################################################
# Accepter Inputs
############################################################

variable "vpc_peering_connection_id" {

  description = "ID of the pending VPC Peering Connection to accept (required when create_accepter = true)"

  type = string

  default = null

}

############################################################
# Peering Routes
############################################################

variable "public_route_table_id" {

  description = "Public Route Table ID to add the peering route to. Leave null to skip."

  type = string

  default = null

}

variable "private_route_table_id" {

  description = "Private Route Table ID to add the peering route to. Leave null to skip."

  type = string

  default = null

}

variable "destination_cidr_block" {

  description = "CIDR block of the peer VPC, used as the destination for peering routes"

  type = string

  default = null

}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Common Tags"

  type = map(string)

  default = {}

}
