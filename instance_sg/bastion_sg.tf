resource "aws_security_group" "emir_bastion_sg" {
  name        = "emir_bastion_sg"
  description = "Allow SSH access to Bastion"
  vpc_id      = data.terraform_remote_state.out_vpc.outputs.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
    Owner = "Emir"
  }
}