resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "emir_eip"
    Owner = "emir"
  }
}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.emir_public_subnet1_eu_central_1a.id
  depends_on    = [aws_internet_gateway.igw]
  tags = {
    Name = "emir_nat"
    Owner = "emir"
  }
}


resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.emir_private_route_table1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
  
}
