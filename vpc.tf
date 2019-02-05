provider "aws" {
  access_key = " "
  secret_key = " "
  region     = "eu-west-2"
}
resource "aws_vpc" "terra_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "terra_vpc"
  }
}
