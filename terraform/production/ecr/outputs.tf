############################################################
# Project Crystal
# Production ECR Outputs
############################################################

output "repository_names" {
  value = {
    for name, repo in module.ecr : name => repo.repository_name
  }
}

output "repository_urls" {
  value = {
    for name, repo in module.ecr : name => repo.repository_url
  }
}

output "repository_arns" {
  value = {
    for name, repo in module.ecr : name => repo.repository_arn
  }
}
