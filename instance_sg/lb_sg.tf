resource "aws_security_group" "emir_lb_sg" {
  name        = "emir_lb_sg"
  description = "allow http inbound"
  vpc_id      = data.terraform_remote_state.out_vpc.outputs.vpc_id


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



