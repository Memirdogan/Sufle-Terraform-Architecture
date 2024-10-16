resource "aws_key_pair" "deployer" {
  key_name   = "memir"
  public_key = file("/home/emir/.ssh/id_rsa.pub")
}


