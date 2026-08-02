############################################################
# Project Crystal
# Module      : NAT Gateway
############################################################

############################################################
# Elastic IP
############################################################

output "elastic_ip_id" {

  description = "Elastic IP ID"

  value = aws_eip.this.id

}

output "elastic_ip_public_ip" {

  description = "Elastic IP Address"

  value = aws_eip.this.public_ip

}

output "elastic_ip_allocation_id" {

  description = "Elastic IP Allocation ID"

  value = aws_eip.this.allocation_id

}

############################################################
# NAT Gateway
############################################################

output "nat_gateway_id" {

  description = "NAT Gateway ID"

  value = aws_nat_gateway.this.id

}

output "nat_gateway_private_ip" {

  description = "NAT Gateway Private IP"

  value = aws_nat_gateway.this.private_ip

}

output "nat_gateway_public_ip" {

  description = "NAT Gateway Public IP"

  value = aws_nat_gateway.this.public_ip

}

output "nat_gateway_network_interface_id" {

  description = "NAT Gateway Network Interface ID"

  value = aws_nat_gateway.this.network_interface_id

}