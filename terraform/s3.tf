resource "aws_s3_bucket" "artifacts" {
  bucket = "ajinkya-cloudnative-artifacts"

  tags = {
    Name = "cloudnative-artifacts"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.artifacts.id

  versioning_configuration {
    status = "Enabled"
  }
}
