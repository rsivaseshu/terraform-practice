module "my-s3-bucket" {
  source      = "../../modules/s3-module"
  bucket_name = "rssr-tf-module-test"

  website = {
    index_document = "index.html"
    error_document = "error.html"
  }

  lifecycle_rule = [{
    id      = "log"
    enabled = true
    prefix  = "log/"

    tags = {
      rule      = "log"
      autoclean = "true"
    }

    transition = [
      {
        days          = 30
        storage_class = "ONEZONE_IA"
        }, {
        days          = 60
        storage_class = "GLACIER"
      }
    ]

    expiration = {
      days = 90
    }
  }]
  tags = {
    Owner = "Siva"
  }
}

resource "aws_s3_bucket_object" "upload_index_file" {
  bucket = module.my-s3-bucket.bucket_name
  key    = "index.html"
  source = "files/index.html"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("files/index.html")
}
