resource "aws_vpc" "levelupvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"

  tags = {
    Name = "levelupvpc"
  }
}

resource "aws_internet_gateway" "levelup-igw" {
  vpc_id = aws_vpc.levelupvpc.id

  tags = {
    Name = "levelup-igw"
  }
}




#public subnets 
resource "aws_subnet" "levelupvpc-public-1" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.1.0/24"
  #map_public_ip_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "levelupvpc-public-1"
  }
}

resource "aws_subnet" "levelupvpc-public-2" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.2.0/24"
  #map_public_ip_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
    Name = "levelupvpc-public-2"
  }
}


resource "aws_subnet" "levelupvpc-public-3" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.3.0/24"
 # map_public_ip_launch = "true"
  availability_zone = "us-east-1c"

  tags = {
    Name = "levelupvpc-public-3"
  }
}





resource "aws_subnet" "levelupvpc-privite-1" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.101.0/24"
#  map_public_ip_launch = "false"
  availability_zone = "us-east-1a"

  tags = {
    Name = "levelupvpc-privite-1"
  }
}


resource "aws_subnet" "levelupvpc-privite-2" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.102.0/24"
 # map_public_ip_launch = "false"
  availability_zone = "us-east-1b"

  tags = {
    Name = "levelupvpc-privite-2"
  }
}


resource "aws_subnet" "levelupvpc-privite-3" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.103.0/24"
 # map_public_ip_launch = "false"
  availability_zone = "us-east-1c"

  tags = {
    Name = "levelupvpc-privite-3"
  }
}


resource "aws_route_table" "levelup-route" {
  vpc_id = aws_vpc.levelupvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.levelup-igw.id
  }
tags = {
    Name = "levelup-route"
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.levelupvpc-public-1.id
  route_table_id = aws_route_table.levelup-route.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.levelupvpc-public-2.id
  route_table_id = aws_route_table.levelup-route.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.levelupvpc-public-3.id
  route_table_id = aws_route_table.levelup-route.id
}

