# Create a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "${var.subnet_vpc}"
}

# subnet dmz
resource "aws_subnet" "subnet_dmz" {
  cidr_block = "${var.subnet_dmz}"
  vpc_id = "${aws_vpc.main_vpc.id}"
}

# subnrt internal
resource "aws_subnet" "subnet_internal" {
  cidr_block = "${var.subnet_internal}"
  vpc_id = "${aws_vpc.main_vpc.id}"
}

