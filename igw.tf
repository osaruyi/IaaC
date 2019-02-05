resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.terra_vpc.id}"

  tags = {
    Name = "uyi_internet_gateway"
  }
}
