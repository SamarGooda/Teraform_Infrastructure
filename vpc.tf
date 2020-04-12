
//vpc
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags={
      Name="ITI-VPC" 
 }
}
//getway
resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.main_vpc.id}"
     tags = {
    Name = "main"
  }
}

output "vpc_id"{
value ="${aws_vpc.main_vpc.id}"
}

