# Cteare Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.procetvpc.id

 
 
 
 # tags = {
  #  Name = "main"
  # }
}


# NAT gateway

resource "aws_nat_gateway" "ng" {
  count         = 3
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  allocation_id = element(aws_eip.ng.*.id, count.index)
}



# This is VPC.

resource "aws_vpc" "projectvpc" {
  cidr_block = "10.0.0.0/16"
}


# Creating subnets


resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.projectvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"  

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.projectvpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"   

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.projectvpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"  

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.projectvpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1a"   

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.projectvpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1b"   

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.projectvpc.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-east-1c"   

  tags = {
    Name = "private-subnet"
  }
}


