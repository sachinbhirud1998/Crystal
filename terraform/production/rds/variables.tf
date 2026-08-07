############################################################
# Production RDS Variables
############################################################

variable "aws_region" { type = string }

variable "identifier" { type = string }

variable "engine" { type = string }

variable "engine_version" { type = string }

variable "instance_class" { type = string }

variable "allocated_storage" { type = number }

variable "storage_type" { type = string }

variable "storage_encrypted" { type = bool }

variable "kms_key_id" {
  type    = string
  default = null
}

variable "username" { type = string }

variable "password" {
  type      = string
  sensitive = true
}

variable "port" { type = number }

variable "db_name" { type = string }

variable "multi_az" { type = bool }

variable "backup_retention_period" { type = number }

variable "skip_final_snapshot" { type = bool }

variable "deletion_protection" { type = bool }

variable "publicly_accessible" { type = bool }

variable "performance_insights_enabled" { type = bool }

variable "monitoring_interval" { type = number }

variable "vpc_id" { type = string }

variable "private_subnet_ids" {
  type = list(string)
}

variable "common_tags" {
  type = map(string)
}
