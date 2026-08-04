############################################################
# Project Crystal
# Production IRSA
############################################################

############################################################
# OIDC Remote State
############################################################

data "terraform_remote_state" "oidc" {

  backend = "local"

  config = {

    path = "../oidc-provider/terraform.tfstate"

  }

}

############################################################
# AWS Load Balancer Controller IRSA
############################################################

module "aws_load_balancer_controller_irsa" {

  source = "../../modules/irsa"

  role_name = "crystal-production-aws-load-balancer-controller-role"

  role_description = "IRSA Role for AWS Load Balancer Controller"

  oidc_provider_arn = data.terraform_remote_state.oidc.outputs.oidc_provider_arn

  oidc_provider_url = data.terraform_remote_state.oidc.outputs.oidc_provider_url

  namespace = "kube-system"

  service_account_name = "aws-load-balancer-controller"

  managed_policy_arns = [

    # Placeholder. We'll attach the official ALB Controller IAM policy
    # in the next milestone after creating it.

  ]

  tags = var.common_tags

}

############################################################
# Amazon EBS CSI Driver IRSA
############################################################

module "ebs_csi_irsa" {

  source = "../../modules/irsa"

  role_name = "crystal-production-ebs-csi-role"

  role_description = "IRSA Role for Amazon EBS CSI Driver"

  oidc_provider_arn = data.terraform_remote_state.oidc.outputs.oidc_provider_arn

  oidc_provider_url = data.terraform_remote_state.oidc.outputs.oidc_provider_url

  namespace = "kube-system"

  service_account_name = "ebs-csi-controller-sa"

  managed_policy_arns = [

    "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"

  ]

  tags = var.common_tags

}
