############################################################
# Project Crystal
# Module      : EKS Cluster
############################################################

resource "aws_eks_cluster" "this" {

  ##########################################################
  # Cluster Configuration
  ##########################################################

  name    = var.cluster_name

  version = var.kubernetes_version

  role_arn = var.cluster_role_arn

  ##########################################################
  # Networking
  ##########################################################

  vpc_config {

    subnet_ids = var.private_subnet_ids

    endpoint_private_access = var.endpoint_private_access

    endpoint_public_access = var.endpoint_public_access

    public_access_cidrs = var.public_access_cidrs

  }

  ##########################################################
  # Control Plane Logging
  ##########################################################

  enabled_cluster_log_types = var.enabled_cluster_log_types

  ##########################################################
  # Tags
  ##########################################################

  tags = merge(

    var.tags,

    {

      Name = var.cluster_name

    }

  )

}

############################################################
# IAM OIDC Provider
############################################################

data "tls_certificate" "oidc" {

  url = aws_eks_cluster.this.identity[0].oidc[0].issuer

}

resource "aws_iam_openid_connect_provider" "this" {

  url = aws_eks_cluster.this.identity[0].oidc[0].issuer

  client_id_list = [

    "sts.amazonaws.com"

  ]

  thumbprint_list = [

    data.tls_certificate.oidc.certificates[0].sha1_fingerprint

  ]

}