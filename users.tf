resource "aws_iam_user" "test_user" {
  name = "test_user"
  tags = {
    Name = "test_user"
  }
}

resource "aws_iam_policy_attachment" "test_attach_assume_policy" {
  name       = "test_attachment_role"
  users      = ["${aws_iam_user.test_user.name}"]
  policy_arn = "${aws_iam_policy.assume_policy.arn}"
}

resource "aws_iam_policy_attachment" "test_manage_self_policy" {
  name       = "manage_self"
  users      = ["${aws_iam_user.test_user.name}"]
  policy_arn = "${aws_iam_policy.manage_self_policy.arn}"
}