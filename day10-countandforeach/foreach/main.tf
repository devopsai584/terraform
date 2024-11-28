provider "aws" {
  
}

resource "aws_instance" "name" {
    ami = var.ami
    key_name = var.key_name
    instance_type = var.instance_type
    for_each = toset(var.mylist)
    tags = {
      Name = each.value
    }
  
}