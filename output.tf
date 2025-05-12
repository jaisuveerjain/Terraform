output "s3_ami" {
  value = aws_s3_bucket.s3_backend.id
  description = "The id of s3 bucket created"
}

output "aminame" {
  value = data.aws_ami.ubuntu.id
  description = "The id of ami of ec2 to be need"
}