data "aws_ami" "ubuntu"{
  most_recent = true

  filter{
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "myubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}

resource "aws_instance" "webb" {
  provider  = aws.ireland
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
      Environment = "Preprod"
  }
}

resource "aws_s3_bucket" "s3_backend"{
	bucket = var.s3_bucket_name

	tags = {
	Environment = "Dev"
	}
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_backend_encry" {
  bucket = aws_s3_bucket.s3_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}
