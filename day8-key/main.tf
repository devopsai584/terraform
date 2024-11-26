resource "aws_key_pair" "name" {
    key_name = "bunnu"
    public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "name" {
    ami = "ami-0453ec754f44f9a4a"
    key_name = aws_key_pair.name.key_name
    instance_type = "t2.micro"
    tags = {
      Name = "test"
    }
}