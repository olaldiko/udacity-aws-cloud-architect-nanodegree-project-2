
resource "aws_s3_bucket" "udacity_project_gorka" {
  bucket = var.bucket_name
  tags = {
    Name = "${var.bucket_name}"
  }
}
