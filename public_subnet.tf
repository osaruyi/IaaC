resource "aws_subnet" "uyipubsubnet" {
  vpc_id     = "${aws_vpc.terra_vpc.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "uyipubsubnet"
  }
}
