############################################################
# Project Crystal
# Module : Kubernetes RBAC
############################################################

output "platform_admin_binding_name" {

  description = "Platform Administrator ClusterRoleBinding"

  value = kubernetes_cluster_role_binding_v1.platform_admin.metadata[0].name

}

output "cicd_service_account_name" {

  description = "CI/CD Service Account"

  value = kubernetes_service_account_v1.cicd.metadata[0].name

}

output "cicd_service_account_namespace" {

  description = "CI/CD Service Account Namespace"

  value = kubernetes_service_account_v1.cicd.metadata[0].namespace

}

output "cicd_cluster_role_binding_name" {

  description = "CI/CD ClusterRoleBinding"

  value = kubernetes_cluster_role_binding_v1.cicd.metadata[0].name

}
