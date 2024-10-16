resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.emirvpc.id
  tags = {
    Name = "emir_igw"
    Owner = "emir"
  }
}
