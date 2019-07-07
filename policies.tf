###########################################
# policy to assume the powerful test role #
###########################################
resource "aws_iam_policy" "assume_policy" {
  name   = "assume_role_policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.assume_role.json}"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    sid    = "Assumerole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]
    condition {
      test = "Bool"
      values = [
      "true"]
      variable = "aws:MultiFactorAuthPresent"
    }

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.account_id.account_id}:role/test_role",
    ]
  }
}

############################################
# policy to manage self (add required MFA) #
############################################
resource "aws_iam_policy" "manage_self_policy" {
  name   = "manage_self_policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.manage_self_mfa.json}"
}

data "aws_iam_policy_document" "manage_self_mfa" {
  statement {
    sid = "MFAManageSelf"
    effect = "Allow"

    actions = [
      "iam:ListVirtualMFADevices",
      "iam:CreateVirtualMFADevice",
      "iam:DeleteVirtualMFADevice",
      "iam:EnableMFADevice",
      "iam:ResyncMFADevice",
      "iam:DeactivateMFADevice"
    ]

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.account_id.account_id}:mfa/&{aws:username}",
      "arn:aws:iam::${data.aws_caller_identity.account_id.account_id}:user/&{aws:username}"
    ]
  }
    statement {
    sid = "MFAListSelf"
    effect = "Allow"

    actions = [
      "iam:ListUsers",
      "iam:ListAccessKeys",
      "iam:ListMFADevices",
      "iam:ListVirtualMFADevices",
    ]

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.account_id.account_id}:mfa/*",
      "arn:aws:iam::${data.aws_caller_identity.account_id.account_id}:user/*"
    ]
  }
}

#####################################
# policy to make powerful test role #
#####################################
resource "aws_iam_role_policy" "priviliged_policy" {
  name        = "priviliged_policy"
  role = "${aws_iam_role.test_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}