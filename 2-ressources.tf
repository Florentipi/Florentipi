resource "aws_instance" "app_server" {
  ami           = "ami-02ea01341a2884771"
  instance_type = var.instance_type (image)
 
  vpc_security_group_ids = ["aws_security_group.allow_tls.id"]
 
  tags = {
    Name = "tpflorentipi"
  }
}
 
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id
 
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 
  tags = {
    Name = "allow_tls"
  }
}