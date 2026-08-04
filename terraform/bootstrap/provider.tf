provider "aws" {
  profile = "shared-services"
  region  = var.aws_region

  default_tags {
    tags = {
      Project     = "Crystal"
      ManagedBy   = "Terraform"
      Environment = "Bootstrap"
    }
  }
}