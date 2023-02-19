data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-*-amd64-server-*"]
  }
}

resource "aws_instance" "ec2_vm" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.ins_type
  key_name      = "devops-jules"
  tags          = var.tag_name
  availability_zone = var.AZ

  security_groups = ["${var.sg_name}"]

  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${var.public_ip} >> ip_ec2.txt"
  }
  
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/home/julios/easytraining/bootcamp_devops_terraform_mini-projet/devops-jules.pem")
      host        = self.public_ip
    }
  }

  root_block_device {
    delete_on_termination = true
  }
}
