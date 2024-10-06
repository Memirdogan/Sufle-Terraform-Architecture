resource "aws_route_table" "emir_public_route_table1" {
  vpc_id = aws_vpc.emirvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "emir_public_route_table1"
    Owner = "emir"
  }
}

resource "aws_route_table_association" "public_subnet_assoc" {
  subnet_id      = aws_subnet.emir_public_subnet1_eu_north_1a.id
  route_table_id = aws_route_table.emir_public_route_table1.id
}