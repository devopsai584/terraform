provider "aws" {
  
}

resource "aws_instance" "name" {
    ami = var.ami
    key_name = var.key_name
    instance_type = var.instance_type
    count = length(var.mylist)
    tags = {
      Name = var.mylist[count.index]
    }
  
}