
############################################################
# Project Crystal
# IRSA Module
############################################################

output "role_name" {

  description = "IAM Role Name"

  value = aws_iam_role.this.name

}

output "role_arn" {

  description = "IAM Role ARN"

  value = aws_iam_role.this.arn

}