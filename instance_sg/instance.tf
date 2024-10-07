resource "aws_instance" "emir_bastion_host" {
  ami           = "ami-08eb150f611ca277f"
  instance_type = "t2.micro"
  subnet_id     = data.terraform_remote_state.out_vpc.outputs.public_subnet_id

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
  ami           = "ami-08eb150f611ca277f"
  instance_type = "t2.micro"
  subnet_id     = data.terraform_remote_state.out_vpc.outputs.private_subnet_id
  security_groups = [
    aws_security_group.emir_ec2_sg.id
  ]

  tags = {
    Name = "EC2-${count.index}"
    Owner = "Emir"
  }
}