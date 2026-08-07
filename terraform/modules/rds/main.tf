############################################################
# Project Crystal
# Amazon RDS Module
############################################################

resource "aws_db_instance" "this" {

  identifier = var.identifier

  engine = var.engine

  engine_version = var.engine_version

  instance_class = var.instance_class

  allocated_storage = var.allocated_storage

  storage_type = var.storage_type

  storage_encrypted = var.storage_encrypted

  kms_key_id = var.kms_key_id

  username = var.username

  password = var.password

  port = var.port

  db_name = var.db_name

  db_subnet_group_name = var.db_subnet_group_name

  vpc_security_group_ids = var.vpc_security_group_ids

  monitoring_role_arn = var.monitoring_role_arn

  multi_az = var.multi_az

  backup_retention_period = var.backup_retention_period

  skip_final_snapshot = var.skip_final_snapshot

  deletion_protection = var.deletion_protection

  publicly_accessible = var.publicly_accessible

  performance_insights_enabled = var.performance_insights_enabled

  monitoring_interval = var.monitoring_interval

  apply_immediately = true

  tags = var.tags

}
