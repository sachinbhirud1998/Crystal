############################################################
# Project Crystal
# Module : Kubernetes RBAC
############################################################

############################################################
# Platform Administrator ClusterRoleBinding
############################################################

resource "kubernetes_cluster_role_binding_v1" "platform_admin" {

  metadata {

    name = "crystal-platform-admin"

  }

  subject {

    kind = "Group"

    name = var.platform_admin_group

    api_group = "rbac.authorization.k8s.io"

  }

  role_ref {

    api_group = "rbac.authorization.k8s.io"

    kind = "ClusterRole"

    name = "cluster-admin"

  }

}

############################################################
# CI/CD Service Account
############################################################

resource "kubernetes_service_account_v1" "cicd" {

  metadata {

    name = var.cicd_service_account_name

    namespace = var.cicd_namespace

  }

}

############################################################
# CI/CD ClusterRoleBinding
############################################################

resource "kubernetes_cluster_role_binding_v1" "cicd" {

  metadata {

    name = "${var.cicd_service_account_name}-cluster-admin"

  }

  subject {

    kind = "ServiceAccount"

    name = kubernetes_service_account_v1.cicd.metadata[0].name

    namespace = kubernetes_service_account_v1.cicd.metadata[0].namespace

  }

  role_ref {

    api_group = "rbac.authorization.k8s.io"

    kind = "ClusterRole"

    name = "cluster-admin"

  }

}