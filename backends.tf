terraform {
  backend "s3" {
    bucket = "manoj-670389-mc"
    key    = "statefile"
    region = "us-east-1"
  }
}