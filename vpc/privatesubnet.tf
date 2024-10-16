resource "aws_subnet" "emir_private_subnet1_eu_central_1a" {
  vpc_id     = aws_vpc.emirvpc.id
  cidr_block = "192.168.3.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "emir_private_subnet1_eu_central_1a"
    Owner = "emir"
  }
}
