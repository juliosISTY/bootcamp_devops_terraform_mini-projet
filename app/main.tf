provider "aws" {
  region = "us-east-1"
}

module "ebs" {
  source = "../modules/ebs"

  ebs_size = 10
}

module "sg" {
  source = "../modules/sg"
}

module "eip" {
  source = "../modules/eip"
}

module "ec2" {
  source = "../modules/ec2"

  ins_type = "t2.micro"
  sg_name  = module.sg.sg_name
  tag_name = {
    Name = "ec2-jules"
  }
  public_ip = module.eip.eip_public_ip
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2.ec2_id
  allocation_id = module.eip.eip_id
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.ebs_id
  instance_id = module.ec2.ec2_id
}

