############################################################
# Outputs
############################################################

output "route_table_id" {
  description = "Public Route Table ID"
  value       = aws_route_table.public.id
}

output "route_table_arn" {
  description = "Public Route Table ARN"
  value       = aws_route_table.public.arn
}