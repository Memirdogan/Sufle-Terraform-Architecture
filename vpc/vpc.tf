resource "aws_vpc" "emirvpc" {
  cidr_block = "192.168.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "emir_vpc"
    Owner = "emir"
  }
}