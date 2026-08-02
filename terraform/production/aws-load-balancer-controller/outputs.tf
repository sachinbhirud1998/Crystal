############################################################
# Project Crystal
# Production AWS Load Balancer Controller
############################################################

############################################################
# Helm Release
############################################################

output "release_name" {

  description = "Helm Release Name"

  value = module.production_aws_load_balancer_controller.release_name

}

output "release_namespace" {

  description = "Helm Release Namespace"

  value = module.production_aws_load_balancer_controller.release_namespace

}

output "chart_name" {

  description = "Helm Chart Name"

  value = module.production_aws_load_balancer_controller.chart_name

}

output "chart_version" {

  description = "Helm Chart Version"

  value = module.production_aws_load_balancer_controller.chart_version

}

output "release_status" {

  description = "Helm Release Status"

  value = module.production_aws_load_balancer_controller.release_status

}
