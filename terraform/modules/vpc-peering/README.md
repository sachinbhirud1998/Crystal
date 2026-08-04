# VPC Peering Module

Creates one side (requester or accepter) of a VPC Peering Connection, and
optionally attaches the routes needed to reach the peer VPC's CIDR from the
public and/or private route tables of this stack.

Production and Shared Services are separate AWS accounts, so a single
instance of this module can only create ONE side. Use two instances (one
per stack) with `create_requester` / `create_accepter` set accordingly.

## Resources

- aws_vpc_peering_connection (requester side, if `create_requester = true`)
- aws_vpc_peering_connection_accepter (accepter side, if `create_accepter = true`)
- aws_route (public, if `public_route_table_id` is set)
- aws_route (private, if `private_route_table_id` is set)

## Inputs

- peering_connection_name
- create_requester / create_accepter
- vpc_id, peer_vpc_id, peer_owner_id, peer_region (requester side)
- vpc_peering_connection_id (accepter side)
- public_route_table_id, private_route_table_id, destination_cidr_block
- tags

## Outputs

- vpc_peering_connection_id
