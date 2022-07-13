resource "aws_vpc" "ashuvpc1" {
    cidr_block = "10.1.0.0/16"
    instance_tenancy = "default"
    tags = {
      "Name" = "ashuvpc"
    }

  
}

resource "aws_subnet" "public-sub" {
    vpc_id = aws_vpc.ashuvpc1.id
    cidr_block = "10.1.1.0/24"
    availability_zone = "us-west-2a"
    tags = {
      "Name" = "public-network1"
    }

  
}