terraform {
  backend "s3" {
    bucket  = "crystal-tfstate-987654321"
    key     = "shared-services/terraform.tfstate"
    region  = "ap-south-1"
    profile = "shared-services"
    encrypt = true
  }
}