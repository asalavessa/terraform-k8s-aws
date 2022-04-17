resource "aws_subnet" "subnet-1" {

    vpc_id            = aws_vpc.prod-vpc.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"

    tags = {
      
      Name = "prod-subnet"

    }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.prod-route-table.id
}