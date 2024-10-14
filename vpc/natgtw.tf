resource "aws_eip" "nat_eip" {
  domain = "vpc"
}



resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id #elastic ip atama
  subnet_id     = aws_subnet.emir_public_subnet1_eu_central_1a.id
  depends_on    = [aws_internet_gateway.igw]  # igw bağlantısı
}


resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.emir_private_route_table1.id  # bu routenin hangi route tableye eklenmesi gerektiğini beliryiror
  destination_cidr_block = "0.0.0.0/0"  # Tüm trafiği yönlendir
  nat_gateway_id         = aws_nat_gateway.nat.id  # NAT Gateway ID
}
