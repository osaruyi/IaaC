resource "aws_subnet" "uyiprisubnet" {
  vpc_id     = "${aws_vpc.terra_vpc.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-2c"

  tags = {
    Name = "uyiprisubnet"
  }
}
