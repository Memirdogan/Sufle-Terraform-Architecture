resource "aws_instance" "emir_bastion_host" {
  ami           = "ami-0084a47cc718c111a"
  instance_type = "t3.micro"
  subnet_id     = data.terraform_remote_state.out_vpc.outputs.public_subnet_id

  key_name = "memir"

  security_groups = [
    aws_security_group.emir_bastion_sg.id
  ]

  tags = {
    Name = "Bastion-Host"
    Owner = "Emir"
  }
}

resource "aws_instance" "emir_ec2_instances" {
  count         = 2
  ami           = "ami-0084a47cc718c111a"
  instance_type = "t3.micro"
  subnet_id     = data.terraform_remote_state.out_vpc.outputs.private_subnet_id

  security_groups = [
    aws_security_group.emir_ec2_sg.id
  ]

  tags = {
    Name = "EC2-${count.index}"
    Owner = "Emir"
  }
}
