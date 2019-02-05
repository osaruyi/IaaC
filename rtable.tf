resource "aws_route_table" "uyi_rtable" {
  vpc_id = "${aws_vpc.terra_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "uyipubsubnet_rtable"
  }
}
# Assign the route table to the public subnet
resource "aws_route_table_association" "uyi_rtable" {
  subnet_id      = "${aws_subnet.uyipubsubnet.id}"
  route_table_id = "${aws_route_table.uyi_rtable.id}"
}
