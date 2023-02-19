resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.AZ
  size              = var.ebs_size

  tags = {
    Name = "jules-disk"
  }
}

