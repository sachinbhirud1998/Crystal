terraform {
  backend "s3" {
    bucket  = "crystal-tfstate-987654321"
    key     = "production/ecr/terraform.tfstate"
    region  = "ap-south-1"
    profile = "production"
    encrypt = true
  }
}
