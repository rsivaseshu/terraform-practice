resource "aws_instance" "web" {
  count = var.instance_count
  ami           = var.ami_id
  instance_type = lookup (var.instance_type, var.env, "t2.small")

  tags = {
    Name = "HelloWorld-${count.index}"
  }
}