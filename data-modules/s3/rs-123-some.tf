data "aws_s3_bucket" "selected" {
  bucket = "rs-123-some"
}


# resource "aws_s3_bucket" "bucket_import" {
#   bucket = "rs-123-some"
# }

data "aws_s3_bucket" "second_import" {
  bucket = "rs-api-get"

}

resource "aws_s3_bucket_policy" "allow_access_for_siva" {
  bucket = data.aws_s3_bucket.second_import.id
  policy = data.aws_iam_policy_document.allow_access_for_siva.json
}

data "aws_iam_policy_document" "allow_access_for_siva" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::829981096048:user/siva"]
    }
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      data.aws_s3_bucket.second_import.arn,
      "${data.aws_s3_bucket.second_import.arn}/*",
    ]
  }
}