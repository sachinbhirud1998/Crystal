############################################################
# Project Crystal
# Shared Services Networking
#
# Outputs from the reusable VPC module.
############################################################

output "vpc_id" {
  description = "Shared Services VPC ID"
  value       = module.shared_services_vpc.vpc_id
}

output "vpc_arn" {
  description = "Shared Services VPC ARN"
  value       = module.shared_services_vpc.vpc_arn
}

output "vpc_cidr" {
  description = "Shared Services VPC CIDR"
  value       = module.shared_services_vpc.vpc_cidr
}