output "vpc_id" {
  value = aws_vpc.emirvpc.id
  description = "VPC ID"
}

output "public_subnet_id" {
  value = aws_subnet.emir_public_subnet1_eu_north_1a.id
}

output "private_subnet_id" {
  value = aws_subnet.emir_private_subnet1_eu_north_1a.id
}
