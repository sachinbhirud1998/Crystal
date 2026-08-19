############################################################
# Project Crystal
# Production ECR - Bank of Anthos
############################################################

module "ecr" {
  source = "../../modules/ecr"

  for_each = var.repository_names

  repository_name      = each.value
  image_tag_mutability = var.image_tag_mutability
  scan_on_push         = var.scan_on_push
  encryption_type      = var.encryption_type
  kms_key_id           = var.kms_key_id
  tags                 = var.common_tags
}
