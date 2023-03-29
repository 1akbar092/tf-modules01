module "EC2" {
  source        = "../child/EC2"
  subnet_id     = module.VPC.public_subnet_id
  sg_ids        = [module.VPC.sg_id]
  instance_type = "t2.micro"
  public_ip_ass = true
}

module "VPC" {
  source   = "../child/VPC"
  sg_ports = [80, 443, 53, 23, 3389, 22, 60, 70, 3306, 8080]
}