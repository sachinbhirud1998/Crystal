############################################################
# Project Crystal
# Amazon ECR Module
############################################################

resource "aws_ecr_repository" "this" {

  name                 = var.repository_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.kms_key_id
  }

  tags = var.tags
}
