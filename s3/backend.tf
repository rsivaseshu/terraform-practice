terraform {
  backend "s3" {
    bucket = "rssr-tf-backend"
    key    = "health_care_s3/s3_remote"
    region = "us-east-1"
    profile = "terraform"
    dynamodb_table = "s3-lock-table"
  }
}
