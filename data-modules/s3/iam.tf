resource "aws_iam_user" "this" {

  name = "${terraform.workspace}-ram"
  tags = merge(
    var.tags, {
      Env   = terraform.workspace
      Owner = "ram"
  })
}
