resource "aws_s3_bucket" "name" {
    bucket = "saiii"
  
}

resource "aws_instance" "name" {
  instance_type        = "t2.micro"
  ami                  = "ami-0453ec754f44f9a4a"
  key_name = "sai"
  
  
}