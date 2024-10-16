resource "aws_key_pair" "deployer" {
  key_name   = "memir"
  public_key = file("/home/emir/.ssh/id_rsa.pub")

  tags = {
    Name = "memir_key_pair"
    Owner = "Emir"
  }
  
}

output "deployer_key_name" {
  value = aws_key_pair.deployer.key_name
}
