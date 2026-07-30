############################################################
# Public Route Table
############################################################

output "public_route_table_id" {

  description = "Public Route Table ID"

  value = aws_route_table.public.id

}

output "public_route_table_arn" {

  description = "Public Route Table ARN"

  value = aws_route_table.public.arn

}

############################################################
# Private Route Table
############################################################

output "private_route_table_id" {

  description = "Private Route Table ID"

  value = aws_route_table.private.id

}

output "private_route_table_arn" {

  description = "Private Route Table ARN"

  value = aws_route_table.private.arn

}