############################################################
# Project Crystal
# RDS Module Variables
############################################################

variable "identifier" {

  description = "RDS Instance Identifier"

  type = string

}

variable "engine" {

  description = "Database Engine"

  type = string

}

variable "engine_version" {

  description = "Database Engine Version"

  type = string

}

variable "instance_class" {

  description = "RDS Instance Class"

  type = string

}

variable "allocated_storage" {

  description = "Allocated Storage"

  type = number

}

variable "storage_type" {

  description = "Storage Type"

  type = string

}

variable "storage_encrypted" {

  description = "Enable Storage Encryption"

  type = bool

}

variable "kms_key_id" {

  description = "KMS Key ARN"

  type = string

  default = null

}

variable "username" {

  description = "Master Username"

  type = string

}

variable "password" {

  description = "Master Password"

  type = string

  sensitive = true

}

variable "port" {

  description = "Database Port"

  type = number

}

variable "db_name" {

  description = "Initial Database Name"

  type = string

}

variable "db_subnet_group_name" {

  description = "DB Subnet Group Name"

  type = string

}

variable "vpc_security_group_ids" {

  description = "Security Groups"

  type = list(string)

}

variable "multi_az" {

  description = "Enable Multi AZ"

  type = bool

}

variable "backup_retention_period" {

  description = "Backup Retention"

  type = number

}

variable "skip_final_snapshot" {

  description = "Skip Final Snapshot"

  type = bool

}

variable "deletion_protection" {

  description = "Enable Deletion Protection"

  type = bool

}

variable "publicly_accessible" {

  description = "Public Accessibility"

  type = bool

}

variable "performance_insights_enabled" {

  description = "Enable Performance Insights"

  type = bool

}

variable "monitoring_interval" {

  description = "Enhanced Monitoring"

  type = number

}

variable "tags" {

  description = "Common Tags"

  type = map(string)

}
