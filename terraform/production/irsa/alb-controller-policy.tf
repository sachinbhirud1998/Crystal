############################################################
# AWS Load Balancer Controller IAM Policy
############################################################

resource "aws_iam_policy" "aws_load_balancer_controller" {

  name = "AWSLoadBalancerControllerIAMPolicy"

  description = "IAM Policy for AWS Load Balancer Controller"

  policy = file("${path.module}/../../policies/aws-load-balancer-controller.json")

  tags = var.common_tags

}
