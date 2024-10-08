resource "aws_subnet" "emir_public_subnet1_eu_central_1a" {
  vpc_id     = aws_vpc.emirvpc.id
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-central-1a"
  tags = {
    Name = "emir_public_subnet1_eu_central_1a"
    Owner = "emir"
  }
}

resource "aws_subnet" "emir_public_subnet2_eu_central_1b" {
  vpc_id     = aws_vpc.emirvpc.id
  cidr_block = "192.168.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-central-1b"
  tags = {
    Name = "emir_public_subnet2_eu_central_1b"
    Owner = "emir"
  }
}
