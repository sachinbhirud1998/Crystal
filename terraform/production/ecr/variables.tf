variable "aws_region" {
  type = string
}

variable "repository_names" {
  type = set(string)
}

variable "image_tag_mutability" {
  type    = string
  default = "MUTABLE"
}

variable "scan_on_push" {
  type    = bool
  default = true
}

variable "encryption_type" {
  type    = string
  default = "AES256"
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "common_tags" {
  type = map(string)
}
