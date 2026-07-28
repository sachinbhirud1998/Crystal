############################################################
# Outputs
############################################################

output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.this.id
}

output "igw_arn" {
  description = "Internet Gateway ARN"
  value       = aws_internet_gateway.this.arn
}