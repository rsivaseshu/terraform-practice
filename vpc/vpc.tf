resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "192.168.0.0/24"

  tags = {
    Name = "Main-subnet-1"
  }
}