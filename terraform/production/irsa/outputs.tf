############################################################
# Project Crystal
# Production IRSA
############################################################

output "alb_controller_role_arn" {

  description = "AWS Load Balancer Controller Role ARN"

  value = module.aws_load_balancer_controller_irsa.role_arn

}

output "ebs_csi_role_arn" {

  description = "Amazon EBS CSI Driver Role ARN"

  value = module.ebs_csi_irsa.role_arn

}
