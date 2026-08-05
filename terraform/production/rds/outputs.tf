output "endpoint" {

  value = module.rds.endpoint

}

output "address" {

  value = module.rds.address

}

output "port" {

  value = module.rds.port

}

output "arn" {

  value = module.rds.db_instance_arn

}

output "id" {

  value = module.rds.db_instance_id

}
