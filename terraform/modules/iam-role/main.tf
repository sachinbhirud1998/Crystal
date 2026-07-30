############################################################
# Project Crystal
# Module: IAM Role
############################################################

############################################################
# Trust Policy
############################################################

data "aws_iam_policy_document" "assume_role" {

  statement {

    effect = "Allow"

    principals {

      type = "Service"

      identifiers = [
        var.service_principal
      ]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

############################################################
# IAM Role
############################################################

resource "aws_iam_role" "this" {

  name               = var.role_name
  description        = var.role_description
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(
    var.tags,
    {
      Name = var.role_name
    }
  )
}

############################################################
# Managed Policy Attachments
############################################################

resource "aws_iam_role_policy_attachment" "managed" {

  for_each = toset(var.managed_policy_arns)

  role = aws_iam_role.this.name

  policy_arn = each.value
}