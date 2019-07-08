# provider aws

data "aws_caller_identity" "account_id" {}

provider "aws" {
  version = ">= 1.0.0, <= 2.7.0"
  region = "${var.region}"
  shared_credentials_file = "${var.credentials}"
  profile = "${var.profile}"
}