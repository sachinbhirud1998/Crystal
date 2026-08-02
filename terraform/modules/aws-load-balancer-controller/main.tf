############################################################
# Project Crystal
# Module      : AWS Load Balancer Controller
############################################################

resource "helm_release" "this" {

  name       = var.release_name
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = var.chart_version

  namespace        = var.namespace
  create_namespace = false

  wait            = true
  timeout         = 600
  cleanup_on_fail = true

  ##########################################################
  # Helm Values
  ##########################################################

  set = [

    {
      name  = "clusterName"
      value = var.cluster_name
    },

    {
      name  = "region"
      value = var.aws_region
    },

    {
      name  = "vpcId"
      value = var.vpc_id
    },

    {
      name  = "serviceAccount.create"
      value = "true"
    },

    {
      name  = "serviceAccount.name"
      value = "aws-load-balancer-controller"
    },

    {
      name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
      value = var.service_account_role_arn
    }

  ]

}