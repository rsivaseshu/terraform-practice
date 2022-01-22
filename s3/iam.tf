locals {
  name = coalesce(var.project, "demo")
  project = join("-", [local.name, "core"])
}


resource "aws_iam_user" "dev-user" {
  name = var.user_name

  tags = {
    tag-key = "tag-value"
    prroject = local.project
  }
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "test-users-policy"
  user = aws_iam_user.dev-user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "policy" {
  name        = "${local.name}-policy"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "ec2:Create*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}