############################################################
# Project Crystal
# Module      : EKS Add-ons
############################################################

############################################################
# Amazon VPC CNI
############################################################

resource "aws_eks_addon" "vpc_cni" {

  cluster_name = var.cluster_name

  addon_name = "vpc-cni"

  addon_version = var.vpc_cni_version

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

  addon_version = var.kube_proxy_version

  resolve_conflicts_on_create = var.resolve_conflicts_on_create

  resolve_conflicts_on_update = var.resolve_conflicts_on_update

  tags = merge(

    var.tags,

    {

      Name = "${var.cluster_name}-kube-proxy"

    }

  )

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

  addon_version = var.coredns_version

  resolve_conflicts_on_create = var.resolve_conflicts_on_create

  resolve_conflicts_on_update = var.resolve_conflicts_on_update

  tags = merge(

    var.tags,

    {

      Name = "${var.cluster_name}-coredns"

    }

  )

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

  addon_version = var.ebs_csi_driver_version

  resolve_conflicts_on_create = var.resolve_conflicts_on_create

  resolve_conflicts_on_update = var.resolve_conflicts_on_update

  tags = merge(

    var.tags,

    {

      Name = "${var.cluster_name}-ebs-csi-driver"

    }

  )

  depends_on = [

    aws_eks_addon.coredns

  ]

}