# role with priviliges
resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "AWS": "${data.aws_caller_identity.account_id.account_id}"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags = {
    Name = "power_role"
  }
}

#################
# codebuildrole #
#################
resource "aws_iam_role" "codebuild" {
  name = "codebuild"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com",
        "AWS": "${data.aws_caller_identity.account_id.account_id}"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "policy_codebuild" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role = "${aws_iam_role.codebuild.name}"
}