###### EC2 instance Public
resource "aws_instance" "MyPublicInstance" {
  ami                         = local.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  security_groups             = var.sg_ids
  tags = {
    "Name" = "MyPublicInstance"
  }
}

###### EC2 instance Private
resource "aws_instance" "MyPrivateInstance" {
  ami                         = local.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.public_ip_ass
  security_groups             = var.sg_ids
  tags = {
    "Name" = "MyPrivateInstance"
  }
}

