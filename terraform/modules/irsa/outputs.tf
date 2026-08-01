############################################################
# Project Crystal
# Module      : IAM Role for Service Account (IRSA)
############################################################

############################################################
# IAM Role
############################################################

output "role_name" {

  description = "IAM Role Name"

  value = aws_iam_role.this.name

}

output "role_arn" {

  description = "IAM Role ARN"

  value = aws_iam_role.this.arn

}

output "role_id" {

  description = "IAM Role ID"

  value = aws_iam_role.this.id

}

############################################################
# Kubernetes
############################################################

output "namespace" {

  description = "Kubernetes Namespace"

  value = var.namespace

}

output "service_account_name" {

  description = "Kubernetes Service Account Name"

  value = var.service_account_name

}