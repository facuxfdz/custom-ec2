resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet_cidr

    tags = {
        Name = "facuxfdz-aws-public-subnet-1"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "facuxfdz-aws-igw-1"
    }
}

resource "aws_route_table" "custom_rt" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "facuxfdz-aws-route-table-1"
    }
}

resource "aws_route_table_association" "rt-association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.custom_rt.id
}