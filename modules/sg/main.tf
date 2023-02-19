resource "aws_security_group" "allow_traffic" {
  name        = "jules-sg"
  description = "Allow HTTP, HTTPS and SSH inbound traffic and all outbound traffic"

  dynamic "ingress" {
    for_each = [80, 443, 22]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
