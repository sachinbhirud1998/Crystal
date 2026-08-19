aws_region = "ap-south-1"

repository_names = [
  "crystal-production-bank-of-anthos-frontend",
  "crystal-production-bank-of-anthos-userservice",
  "crystal-production-bank-of-anthos-contacts",
  "crystal-production-bank-of-anthos-ledgerwriter",
  "crystal-production-bank-of-anthos-balancereader",
  "crystal-production-bank-of-anthos-transactionhistory",
  "crystal-production-bank-of-anthos-loadgenerator"
]

image_tag_mutability = "MUTABLE"

scan_on_push = true

encryption_type = "AES256"

kms_key_id = null

common_tags = {
  Project     = "Crystal"
  Environment = "Production"
  ManagedBy   = "Terraform"
}
