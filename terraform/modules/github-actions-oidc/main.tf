############################################################
# GitHub OIDC Provider
############################################################

resource "aws_iam_openid_connect_provider" "github" {

  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]

}

############################################################
# Assume Role Policy
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
        aws_iam_openid_connect_provider.github.arn
      ]

    }

    condition {

      test = "StringEquals"

      variable = "token.actions.githubusercontent.com:aud"

      values = [
        "sts.amazonaws.com"
      ]

    }

    condition {

      test = "StringLike"

      variable = "token.actions.githubusercontent.com:sub"

      values = flatten([
        for branch in var.allowed_branches : [
          "repo:${split("/", var.github_repository)[0]}@*/${split("/", var.github_repository)[1]}@*:ref:${branch}",
          "repo:${var.github_repository}:ref:${branch}"
        ]
      ])

    }

  }

}

############################################################
# GitHub Actions Role
############################################################

resource "aws_iam_role" "github_actions" {

  name = var.role_name

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(
    var.tags,
    {
      Name = var.role_name
    }
  )

}

############################################################
# Terraform Permissions
############################################################

resource "aws_iam_policy" "terraform" {

  name = "${var.role_name}-policy"

  description = "Terraform deployment policy"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "ec2:*",
          "eks:*",
          "elasticloadbalancing:*",
          "autoscaling:*",
          "iam:*",
          "kms:*",
          "logs:*",
          "ssm:*",
          "cloudwatch:*",
          "route53:*",
          "s3:*"

        ]

        Resource = "*"

      }

    ]

  })

}

############################################################
# Attach Policy
############################################################

resource "aws_iam_role_policy_attachment" "terraform" {

  role = aws_iam_role.github_actions.name

  policy_arn = aws_iam_policy.terraform.arn

}
