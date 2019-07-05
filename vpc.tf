# VPC
resource "aws_vpc" "my_main" {
  cidr_block = "10.40.40.0/22"
  tags {
    Name = "my_main_vpc"
  }
}