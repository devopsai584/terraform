provider "aws" {
  
}

variable "bucket" {
  description = "Set to true to create the S3 bucket."
  type        = bool
  default     = true
}

resource "random_string" "suffix" {
  count   = var.bucket ? 1 : 0
  length  = 10
  special = false
  upper   = true
}

resource "aws_s3_bucket" "example" {
  count = var.create_bucket ? 1 : 0

  bucket = "devara123-${random_string.suffix[count.index].id}"
  acl    = "private"

  tags = {
    Name        = "varapara"
    Environment = "Dev"
  }
}
