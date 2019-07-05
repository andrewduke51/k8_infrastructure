# provider aws
provider "aws" {
  version = ">= 1.0.0, <= 2.7.0"
  region  = "us-east-1"
  shared_credentials_file = "${var.credentials}"
  profile = "${var.profile}"
}