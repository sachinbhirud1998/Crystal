############################################################
# Public Subnets
############################################################

output "public_subnet_ids" {
  description = "Public Subnet IDs"

  value = {
    for subnet_name, subnet in aws_subnet.public :
    subnet_name => subnet.id
  }
}

############################################################
# Private Subnets
############################################################

output "private_subnet_ids" {
  description = "Private Subnet IDs"

  value = {
    for subnet_name, subnet in aws_subnet.private :
    subnet_name => subnet.id
  }
}