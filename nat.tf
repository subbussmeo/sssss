resource "aws_eip" "levelup-nat" {
  vpc              = true
}

resource "aws_nat_gateway" "levelup-nat-gw" {
  allocation_id = aws_eip.levelup-nat.id
  subnet_id     = aws_subnet.levelupvpc-public-1.id
  depends_on = [aws_internet_gateway.levelup-igw]
}

resource "aws_route_table" "levelup-privite" {
  vpc_id = aws_vpc.levelupvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.levelup-igw.id
  }
tags = {
    Name = "levelup-privite"
  }
}

resource "aws_route_table_association" "pa" {
  subnet_id      = aws_subnet.levelupvpc-privite-1.id
  route_table_id = aws_route_table.levelup-privite.id
}

resource "aws_route_table_association" "pb" {
  subnet_id      = aws_subnet.levelupvpc-privite-2.id
  route_table_id = aws_route_table.levelup-privite.id
}

resource "aws_route_table_association" "pc" {
  subnet_id      = aws_subnet.levelupvpc-privite-3.id
  route_table_id = aws_route_table.levelup-privite.id
}

