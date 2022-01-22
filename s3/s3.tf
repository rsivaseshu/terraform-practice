resource "aws_s3_bucket" "my_first_bucket" {
  bucket   = "rssr-tf-bucket"
  acl      = "private"
  for_each = var.tags
  tags = {
    Owner        = each.value.Owner
    Environment  = each.value.env
    project_name = each.value.project
    CostCenter   = each.value.CostCenter
  }
}