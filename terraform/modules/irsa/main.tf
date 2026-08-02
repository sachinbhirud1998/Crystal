############################################################
# Project Crystal
# IRSA Module
############################################################

############################################################
# Trust Policy
############################################################

data "aws_iam_policy_document" "assume_role" {

  statement {

    effect = "Allow"

    actions = [

      "sts:AssumeRoleWithWebIdentity"

    ]

    principals {

      type = "Federated"

      identifiers = [

        var.oidc_provider_arn

      ]

    }

    condition {

      test = "StringEquals"

      variable = "${replace(var.oidc_provider_url, "https://", "")}:sub"

      values = [

        "system:serviceaccount:${var.namespace}:${var.service_account_name}"

      ]

    }

    condition {

      test = "StringEquals"

      variable = "${replace(var.oidc_provider_url, "https://", "")}:aud"

      values = [

        "sts.amazonaws.com"

      ]

    }

  }

}

############################################################
# IAM Role
############################################################

resource "aws_iam_role" "this" {

  name = var.role_name

  description = var.role_description

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(

    var.tags,

    {

      Name = var.role_name

    }

  )

}

############################################################
# Managed Policies
############################################################

resource "aws_iam_role_policy_attachment" "managed" {

  for_each = toset(var.managed_policy_arns)

  role = aws_iam_role.this.name

  policy_arn = each.value

}
