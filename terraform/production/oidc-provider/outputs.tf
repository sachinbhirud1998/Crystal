############################################################
# Project Crystal
# Production OIDC Provider
############################################################

output "oidc_provider_arn" {

  description = "OIDC Provider ARN"

  value = module.production_oidc_provider.oidc_provider_arn

}

output "oidc_provider_url" {

  description = "OIDC Provider URL"

  value = module.production_oidc_provider.oidc_provider_url

}
