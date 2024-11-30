provider "aws" {
  
}


resource "aws_instance" "myec2" {
  ami                    = "ami-0453ec754f44f9a4a"     #change ami id for different region
  instance_type          = "t2.micro"
  key_name               = "sai"              #change key name as per your setup
 
  tags = {
    Name = "forloop-ec2"
  }

  root_block_device {         #we can give custom value here 
    volume_size = 40
  }
}

resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "Allow TLS inbound traffic"

  ingress = [
    for sg in [22, 80, 443, 8080, 9000, 3000, 8082] : {
      description      = "inbound rules"
      from_port        = sg
      to_port          = sg
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysecgr"
  }
}