resource "aws_subnet" "emir_public_subnet1_eu_north_1a" {
  vpc_id     = aws_vpc.emirvpc.id
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-north-1a"
  tags = {
    Name = "emir_public_subnet1_eu_north_1a"
    Owner = "emir"
  }
}
