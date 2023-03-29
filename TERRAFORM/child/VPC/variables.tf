variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  type    = string
  default = "20.0.0.0/24"
}

variable "private_subnet_cidr_block" {
  type    = string
  default = "20.0.1.0/24"
}

variable "sg_ports" {
  type    = list(any)
  default = []
}
