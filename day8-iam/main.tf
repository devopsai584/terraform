# Create IAM policy
resource "aws_iam_policy" "my_policy" {
  name = "my_policy"
  description = "Permissions for s3"
  policy      = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
            Action: "s3:*",
            Effect: "Allow",
            Resource: "*"
        }
      ]
    })
}

# Create IAM role
resource "aws_iam_role" "my_role" {
  name = "my_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "myrole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# Attach IAM policy to IAM role
resource "aws_iam_policy_attachment" "policy_attach" {
  name       = "ec2-s3"
  roles      = [aws_iam_role.my_role.name]
  policy_arn = aws_iam_policy.my_policy.arn
}

# Create instance profile using role
resource "aws_iam_instance_profile" "my_profile" {
  name = "my_profile"
  role = aws_iam_role.my_role.name
}
# Create EC2 instance and attache IAM role
resource "aws_instance" "my_instance" {
  instance_type        = "t2.micro"
  ami                  = "ami-0453ec754f44f9a4a"
  iam_instance_profile = aws_iam_instance_profile.my_profile.name
  key_name = "sai"
  tags = {
    Name = "dev"
  }
}