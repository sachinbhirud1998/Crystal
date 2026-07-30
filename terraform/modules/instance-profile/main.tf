############################################################
# Project Crystal
# Module: IAM Instance Profile
############################################################

resource "aws_iam_instance_profile" "this" {

  name = var.instance_profile_name
  role = var.role_name

  tags = merge(
    var.tags,
    {
      Name = var.instance_profile_name
    }
  )
}