terraform {

  backend "s3" {

    bucket = "crystal-tfstate-987654321"
    key    = "production/github-oidc/terraform.tfstate"
    region = "ap-south-1"

  }

}
