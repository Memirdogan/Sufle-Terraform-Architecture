output "vpc_id" {
  value = aws_vpc.emirvpc.id
  description = "VPC ID"
}

output "public_subnet_id" {
  value = aws_subnet.emir_public_subnet1_eu_central_1a.id
}

output "public_subnet_id2" {
  value = aws_subnet.emir_public_subnet2_eu_central_1b.id
}

output "private_subnet_id" {
  value = aws_subnet.emir_private_subnet1_eu_central_1a.id
}