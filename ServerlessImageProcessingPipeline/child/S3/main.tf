####### S3 bucket
resource "aws_s3_bucket" "image_bucket" {
  bucket = var.bucket_name
}