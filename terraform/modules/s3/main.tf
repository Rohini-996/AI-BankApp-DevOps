
resource "aws_s3_bucket" "aws_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
    Project     = "AI-BankApp"
  }
}

resource "aws_s3_bucket_versioning" "aws_bucket" {
  bucket = aws_s3_bucket.aws_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "aws_bucket" {
  bucket = aws_s3_bucket.aws_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "aws_bucket" {
  bucket = aws_s3_bucket.aws_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
