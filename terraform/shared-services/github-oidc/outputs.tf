output "github_actions_role_arn" {

  value = module.github_oidc.role_arn

}

output "github_actions_role_name" {

  value = module.github_oidc.role_name

}

output "github_oidc_provider_arn" {

  value = module.github_oidc.oidc_provider_arn

}
