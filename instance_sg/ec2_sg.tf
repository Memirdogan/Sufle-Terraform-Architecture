resource "aws_security_group" "emir_ec2_sg" {
  name        = "emir_ec2_sg"
  description = "Allow HTTP from Load Balancer and SSH from Bastion Host"
  vpc_id      = data.terraform_remote_state.out_vpc.outputs.vpc_id

  ingress {
    description = "Allow SSH from Bastion Host"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.emir_bastion_sg.id]
  }

  ingress {
    description = "Allow HTTP from Load Balancer"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "Allow HTTPs from Load Balancer"
    from_port   = 443
    to_port     = 443
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