
output "bucket_name" {
  value = aws_s3_bucket.aws_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.aws_bucket.arn
}
