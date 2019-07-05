# vpc
module "vpc_a" {
  source = "./vpc/"
  subnet_vpc = "${var.subnet_vpc}"
  subnet_dmz = "${var.subnet_dmz}"
  subnet_internal = "${var.subnet_internal}"
}