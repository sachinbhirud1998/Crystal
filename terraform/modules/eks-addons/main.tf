############################################################
# Project Crystal
# Reusable EKS Add-ons Module
############################################################

############################################################
# Fetch Latest Compatible Add-on Version
############################################################

data "aws_eks_addon_version" "this" {

  for_each = var.addons

  addon_name = each.key

  kubernetes_version = var.kubernetes_version

  most_recent = true

}

############################################################
# EKS Managed Add-on
############################################################

resource "aws_eks_addon" "this" {

  for_each = var.addons

  cluster_name = var.cluster_name

  addon_name = each.key

  addon_version = data.aws_eks_addon_version.this[each.key].version

  resolve_conflicts_on_create = try(each.value.resolve_conflicts_on_create, "OVERWRITE")

  resolve_conflicts_on_update = try(each.value.resolve_conflicts_on_update, "OVERWRITE")

  service_account_role_arn = try(each.value.service_account_role_arn, null)

  tags = merge(

    var.tags,

    {

      Name = each.key

    }

  )

}