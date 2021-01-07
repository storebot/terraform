provider "aws" {
  region = "us-east-1"
}

variable "vpc_id2" {
  default = "vpc-08b1bf2cda77484c9"
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_subnet" "example" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = "us-east-1a"
  cidr_block        = cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)
}