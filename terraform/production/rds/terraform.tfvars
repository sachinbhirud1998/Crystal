aws_region = "ap-south-1"

identifier = "crystal-production-postgres"

engine = "postgres"

engine_version = "17"

instance_class = "db.t3.micro"

allocated_storage = 20

storage_type = "gp3"

storage_encrypted = true

kms_key_id = null

username = "crystaladmin"

port = 5432

db_name = "crystal"

vpc_id = "vpc-0e75815bda5198e04"

private_subnet_ids = [
  "subnet-00e52cdfdac9f330a",
  "subnet-007c5eec701ca06ef"
]

multi_az = false

backup_retention_period = 7

skip_final_snapshot = true

deletion_protection = false

publicly_accessible = false

performance_insights_enabled = false

monitoring_interval = 60

common_tags = {
  Project     = "Crystal"
  Environment = "Production"
  ManagedBy   = "Terraform"
}
