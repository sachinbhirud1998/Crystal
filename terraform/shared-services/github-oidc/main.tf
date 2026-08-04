module "github_oidc" {

  source = "../../modules/github-actions-oidc"

  github_repository = "sachinbhirud1998/Crystal"

  allowed_branches = [

    "refs/heads/main",

    "refs/heads/feature/*"

  ]

  role_name = "crystal-github-actions-role"

  tags = var.common_tags

}
