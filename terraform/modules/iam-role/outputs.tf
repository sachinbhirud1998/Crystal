############################################################
# Project Crystal
# Module: IAM Role
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