resource "aws_eip" "elasticip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "natGateway" {
  allocation_id = aws_eip.elasticip.id
  subnet_id     = aws_subnet.subnets_m["PublicSubnet1"].id
  tags = {
    Name = "natGateway"
  }
  depends_on = [aws_internet_gateway.IG]
}