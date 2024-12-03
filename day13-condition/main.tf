provider "aws" {
  
}

variable "instance" {
    type = bool
    default = false
  
}

resource "aws_instance" "name" {
    count = var.instance ? 1 : 0
    ami = "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"
    key_name = "sai"

    tags = {
      Name = "ec2"
    }
  
}