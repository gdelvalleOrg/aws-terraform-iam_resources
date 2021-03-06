provider "aws" {
  version = "~> 1.2"
  region  = "us-west-2"
}

data "aws_iam_policy_document" "ec2_instance_policy" {
  statement {
    effect    = "Allow"
    actions   = ["cloudformation:Describe"]
    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "ssm:CreateAssociation",
      "ssm:DescribeInstanceInformation",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "cloudwatch:PutMetricData",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:ListMetrics",
      "logs:CreateLogStream",
      "ec2:DescribeTags",
      "logs:DescribeLogStreams",
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
      "ssm:GetParameter",
    ]

    resources = ["*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["ec2:DescribeTags"]
    resources = ["*"]
  }
}

module "ec2_instance_role" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-iam_resources//modules/role?ref=v0.0.1"

  name        = "EC2InstanceRole"
  aws_service = ["ec2.amazonaws.com"]

  policy_arns       = ["arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"]
  policy_arns_count = 1

  inline_policy       = ["${data.aws_iam_policy_document.ec2_instance_policy.json}"]
  inline_policy_count = 1
}
