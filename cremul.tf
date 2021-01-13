resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "subbu" {
ami = "ami-0885b1f6bd170450c"
instance_type = "t2.micro"
key_name = aws_key_pair.my-key.key_name
vpc_security_group_ids = [aws_security_group.allow_rule.id]
subnet_id = aws_subnet.levelupvpc-public-2.id

tags = {
Name = "subbu"
}
}
