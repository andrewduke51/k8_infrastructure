# Cloud provider
provider "aws" {
  version = ">= 1.0.0, <= 2.0.0"
  shared_credentials_file = "${var.credentials}"
  region = "${var.region}"
}