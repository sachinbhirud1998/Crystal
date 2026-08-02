############################################################
# Project Crystal
# Production RBAC
############################################################

module "production_rbac" {

  source = "../../modules/rbac"

  platform_admin_group = var.platform_admin_group

  cicd_service_account_name = var.cicd_service_account_name

  cicd_namespace = var.cicd_namespace

}
