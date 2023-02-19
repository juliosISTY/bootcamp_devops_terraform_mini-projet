variable "ebs_size" {
  default = 40
  type    = number
}
variable "tag_name" {
  default = {
    Name = "ec2-exemple"
  }
  type = map(any)
}
variable "AZ" {
  default = "us-east-1b"
  type    = string
}
