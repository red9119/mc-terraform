resource "aws_s3_bucket" "demobucket" {
  bucket = "${var.bucket_name}" 
  acl = "${var.acl_value}"
}