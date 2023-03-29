locals {
  ami_id = data.aws_ami.amznlx2.id
}

###--------------------------------
data "aws_ami" "amznlx2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

###### EC2 instance
resource "aws_instance" "MyInstance01" {
  ami                         = local.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.public_ip_ass
  security_groups             = var.sg_ids
  tags = {
    "Name" = "MyInstance01"
  }
}
