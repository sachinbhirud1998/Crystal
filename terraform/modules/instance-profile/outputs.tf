############################################################
# Project Crystal
# Module: IAM Instance Profile
############################################################

output "instance_profile_name" {
  description = "IAM Instance Profile Name"

  value = aws_iam_instance_profile.this.name
}

output "instance_profile_arn" {
  description = "IAM Instance Profile ARN"

  value = aws_iam_instance_profile.this.arn
}

output "instance_profile_id" {
  description = "IAM Instance Profile ID"

  value = aws_iam_instance_profile.this.id
}