############################################################
# Project Crystal
# Module      : EKS Add-ons
############################################################

############################################################
# Latest Compatible Add-on Versions
############################################################

data "aws_eks_addon_version" "vpc_cni" {

  addon_name = "vpc-cni"

  kubernetes_version = var.cluster_version

  most_recent = true

}

data "aws_eks_addon_version" "kube_proxy" {

  addon_name = "kube-proxy"

  kubernetes_version = var.cluster_version

  most_recent = true

}

data "aws_eks_addon_version" "coredns" {

  addon_name = "coredns"

  kubernetes_version = var.cluster_version

  most_recent = true

}

data "aws_eks_addon_version" "ebs_csi_driver" {

  addon_name = "aws-ebs-csi-driver"

  kubernetes_version = var.cluster_version

  most_recent = true

}

############################################################
# Amazon VPC CNI
############################################################

resource "aws_eks_addon" "vpc_cni" {

  cluster_name = var.cluster_name

  addon_name = "vpc-cni"

  addon_version = data.aws_eks_addon_version.vpc_cni.version

  resolve_conflicts_on_create = var.resolve_conflicts_on_create

  resolve_conflicts_on_update = var.resolve_conflicts_on_update

  tags = merge(

    var.tags,

    {

      Name = "${var.cluster_name}-vpc-cni"

    }

  )

}

############################################################
# kube-proxy
############################################################

resource "aws_eks_addon" "kube_proxy" {

  cluster_name = var.cluster_name

  addon_name = "kube-proxy"

  addon_version = data.aws_eks_addon_version.kube_proxy.version

  resolve_conflicts_on_create = var.resolve_conflicts_on_create

  resolve_conflicts_on_update = var.resolve_conflicts_on_update

  depends_on = [

    aws_eks_addon.vpc_cni

  ]

}

############################################################
# CoreDNS
############################################################

resource "aws_eks_addon" "coredns" {

  cluster_name = var.cluster_name

  addon_name = "coredns"

  addon_version = data.aws_eks_addon_version.coredns.version

  resolve_conflicts_on_create = var.resolve_conflicts_on_create

  resolve_conflicts_on_update = var.resolve_conflicts_on_update

  depends_on = [

    aws_eks_addon.kube_proxy

  ]

}

############################################################
# Amazon EBS CSI Driver
############################################################

resource "aws_eks_addon" "ebs_csi_driver" {

  cluster_name = var.cluster_name

  addon_name = "aws-ebs-csi-driver"

  addon_version = data.aws_eks_addon_version.ebs_csi_driver.version

  service_account_role_arn = var.ebs_csi_irsa_role_arn

  resolve_conflicts_on_create = var.resolve_conflicts_on_create

  resolve_conflicts_on_update = var.resolve_conflicts_on_update

  depends_on = [

    aws_eks_addon.coredns

  ]

}