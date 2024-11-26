module "name" {
     source = "github.com/devopsai584/terraform-sai/day2-ec2"
     ami = "ami-0453ec754f44f9a4a"
     instance_type = "t2.micro"
     key_name = "sai"
     Name = "dev"
}