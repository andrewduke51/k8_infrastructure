variable "credentials" {
  default = ""
}

variable "profile" {
  default = ""
}

variable "region" {
  default = ""
}

variable "subnet_vpc" {
  default = "10.200.100.0/22"
}

variable "subnet_dmz" {
  default = "10.200.101.0/24"
}

variable "subnet_internal" {
  default = "10.200.102.0/24"
}

variable "role_arn" {
  default = ""
}

variable "sess_name" {
  default = ""
}

variable "mfa_id" {
  default = ""
}