############################################################
# Project Crystal
# Production RDS
############################################################

resource "aws_security_group" "rds" {

  name = "${var.identifier}-security-group"

  description = "Production RDS Security Group"

  vpc_id = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.identifier}-security-group"
    }
  )

}

resource "aws_db_subnet_group" "rds" {

  name = "crystal-production-db-subnet-group"

  description = "Production RDS DB Subnet Group"

  subnet_ids = var.private_subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name = "crystal-production-db-subnet-group"
    }
  )

}

resource "aws_iam_role" "rds_monitoring" {

  name = "crystal-production-rds-monitoring-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "monitoring.rds.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]

  })

  tags = var.common_tags

}

module "rds" {

  source = "../../modules/rds"

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

  db_subnet_group_name = aws_db_subnet_group.rds.name

  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]

  monitoring_role_arn = aws_iam_role.rds_monitoring.arn

  multi_az = var.multi_az

  backup_retention_period = var.backup_retention_period

  skip_final_snapshot = var.skip_final_snapshot

  deletion_protection = var.deletion_protection

  publicly_accessible = var.publicly_accessible

  performance_insights_enabled = var.performance_insights_enabled

  monitoring_interval = var.monitoring_interval

  tags = var.common_tags

}
