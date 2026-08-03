############################################################
# Outputs
############################################################

output "vpc_peering_connection_id" {

  description = "VPC Peering Connection ID (resolved from whichever side this instance created)"

  value = local.peering_connection_id

}
