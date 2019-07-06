//# role with priviliges
//resource "aws_iam_role" "role_with_priviliges" {
//  assume_role_policy = "${aws_iam_policy.role_policy_with_privilige.arn}"
//}
//
//# privilige with policy
//
//# privilige policy document
//data "aws_iam_policy_document" "role_privilige_policy" {
//  statement {
//    sid = "role_with_privilige"
//    principals {
//      identifiers = ["*"]
//      type = "Service"
//    }
//    actions = ["*"]
//
//    resources = ["*"]
//  }
//}
//
//resource "aws_iam_policy" "role_policy_with_privilige" {
//  name = "role_policy_with_privilige"
//  policy = "${data.aws_iam_policy_document.role_privilige_policy.json}"
//}