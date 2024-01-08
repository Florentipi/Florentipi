resource "aws_instance" "tpflorentipi" {
  ami           = "ami-02ea01341a2884771"
  instance_type = "t2.micro"
 
  tags = {
    Name = "tpflorentipi"
  }
}
 
resource "aws_security_group" "default" {
  name        = "default"
  vpc_id      = "vpc-008a0a282ae422260"
  }
