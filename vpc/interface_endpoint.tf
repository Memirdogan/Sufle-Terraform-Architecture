resource "aws_vpc_endpoint" "ssm_endpoint" {
  vpc_id             = aws_vpc.emirvpc.id
  service_name       = "com.amazonaws.eu-central-1.ssm"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.emir_private_subnet1_eu_central_1a.id]
  security_group_ids = [data.terraform_remote_state.instance_sg.outputs.ec2_sg_id]

  tags = {
    Name  = "Emir-SSM-Interface-Endpoint"
    Owner = "Emir"
  }
}

resource "aws_vpc_endpoint" "ec2_endpoint" {
  vpc_id             = aws_vpc.emirvpc.id
  service_name       = "com.amazonaws.eu-central-1.ec2"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.emir_private_subnet1_eu_central_1a.id]
  security_group_ids = [data.terraform_remote_state.instance_sg.outputs.ec2_sg_id]

  tags = {
    Name  = "Emir-EC2-Interface-Endpoint"
    Owner = "Emir"
  }
}

resource "aws_vpc_endpoint" "ec2_endpoint2" {
  vpc_id             = aws_vpc.emirvpc.id
  service_name       = "com.amazonaws.eu-central-1.ec2messages"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.emir_private_subnet1_eu_central_1a.id]
  security_group_ids = [data.terraform_remote_state.instance_sg.outputs.ec2_sg_id]

  tags = {
    Name  = "Emir-EC2-Interface-Endpoint2"
    Owner = "Emir"
  }
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id            = aws_vpc.emirvpc.id
  service_name      = "com.amazonaws.eu-central-1.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.emir_private_route_table1.id
  ]

  tags = {
    Name  = "Emir-S3-Endpoint"
    Owner = "Emir"
  }
}


