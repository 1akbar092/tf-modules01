variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "public_ip_ass" {
  type    = bool
  default = false
}

variable "sg_ids" {
  type = list(any)
}

variable "private_subnet_id" {
  type    = string
  default = ""
}