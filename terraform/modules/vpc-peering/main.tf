############################################################
# Project Crystal
# Module      : VPC Peering
#
# Production and Shared Services live in separate AWS
# accounts, so the peering connection is created in two
# steps across two separate applies:
#
#   1. Requester side (create_requester = true)
#      -> aws_vpc_peering_connection
#      -> auto_accept = false (cross-account connections
#         cannot be auto-accepted by the requester)
#
#   2. Accepter side (create_accepter = true)
#      -> aws_vpc_peering_connection_accepter
#      -> takes the pending connection ID output by step 1
#
# Both sides may also attach the routes needed to route
# traffic to the peer CIDR over the connection.
############################################################

############################################################
# Requester
############################################################

resource "aws_vpc_peering_connection" "this" {

  count = var.create_requester ? 1 : 0

  vpc_id = var.vpc_id

  peer_vpc_id   = var.peer_vpc_id
  peer_owner_id = var.peer_owner_id
  peer_region   = var.peer_region

  auto_accept = false

  tags = merge(
    var.tags,
    {
      Name = var.peering_connection_name
    }
  )
}

############################################################
# Accepter
############################################################

resource "aws_vpc_peering_connection_accepter" "this" {

  count = var.create_accepter ? 1 : 0

  vpc_peering_connection_id = var.vpc_peering_connection_id

  auto_accept = true

  tags = merge(
    var.tags,
    {
      Name = var.peering_connection_name
    }
  )
}

############################################################
# Resolved Connection ID
#
# Whichever side this module instance creates, resolve a
# single connection ID so the routes below work the same
# way regardless of requester/accepter role.
############################################################

locals {

  peering_connection_id = (
    var.create_requester ? aws_vpc_peering_connection.this[0].id :
    var.create_accepter ? aws_vpc_peering_connection_accepter.this[0].id :
    null
  )

}

############################################################
# Public Route
############################################################

resource "aws_route" "public_peering" {

  count = var.public_route_table_id != null ? 1 : 0

  route_table_id = var.public_route_table_id

  destination_cidr_block = var.destination_cidr_block

  vpc_peering_connection_id = local.peering_connection_id
}

############################################################
# Private Route
############################################################

resource "aws_route" "private_peering" {

  count = var.private_route_table_id != null ? 1 : 0

  route_table_id = var.private_route_table_id

  destination_cidr_block = var.destination_cidr_block

  vpc_peering_connection_id = local.peering_connection_id
}
