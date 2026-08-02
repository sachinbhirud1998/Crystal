############################################################
# Project Crystal
# Production RBAC
############################################################

output "platform_admin_binding_name" {

  value = module.production_rbac.platform_admin_binding_name

}

output "cicd_service_account_name" {

  value = module.production_rbac.cicd_service_account_name

}

output "cicd_service_account_namespace" {

  value = module.production_rbac.cicd_service_account_namespace

}

output "cicd_cluster_role_binding_name" {

  value = module.production_rbac.cicd_cluster_role_binding_name

}
