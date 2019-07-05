# vpc
module "vpc_a" {
  source          = "git@github.com:andrewduke51/vpc.git?ref=v2.7"
  subnet_vpc      = "${var.subnet_vpc}"
  subnet_dmz      = "${var.subnet_dmz}"
  subnet_internal = "${var.subnet_internal}"
}