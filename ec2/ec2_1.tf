resource "aws_instance" "web" {
  ami           = "ami-08eb150f611ca277f"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}