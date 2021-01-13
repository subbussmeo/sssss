resource "aws_security_group" "allow_rule" {
  name        = "allow_rule"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.levelupvpc.id

  ingress {
    description = "TLS from VPC"
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
    Name = "allow-rule"
  }
}
