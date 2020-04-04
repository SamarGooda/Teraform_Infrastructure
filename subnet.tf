 //  public Subnet 1

resource "aws_subnet" "public1" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    tags ={
        Name = "Public_Subnet1"
    }
}
 
//  public Subnet 2

resource "aws_subnet" "public2" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "Public_Subnet2"
    }
}
// route for public

resource "aws_route_table" "rout_public" {
  vpc_id = "${aws_vpc.main_vpc.id}"

  route {
    cidr_block =  "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
   }
    tags = {
        Name = "Public_Subnet"
    }
  }

resource "aws_route_table_association" "associate_public1" {
    subnet_id = "${aws_subnet.public1.id}"
    route_table_id = "${aws_route_table.rout_public.id}"
}

resource "aws_route_table_association" "associate_public2" {
    subnet_id = "${aws_subnet.public2.id}"
    route_table_id = "${aws_route_table.rout_public.id}"
}




//  Private Subnet1

resource "aws_subnet" "private1" {
      vpc_id = "${aws_vpc.main_vpc.id}"

    cidr_block = "10.0.1.0/24"

    tags ={
        Name = "Private_Subnet1"
    }
}
//  Private Subnet2

resource "aws_subnet" "private2" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    cidr_block = "10.0.2.0/24"

    tags ={
        Name = "Private_Subnet2"
    }
}

/* route for private */
resource "aws_route_table" "rout_private" {
  vpc_id = "${aws_vpc.main_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
     }
   tags = {
        Name = "private_Subnet"
    }

}
//associate private subnet 1
resource "aws_route_table_association" "associate-private1" {
    subnet_id = "${aws_subnet.private1.id}"
    route_table_id = "${aws_route_table.rout_private.id}"
}


//associate private subnet 2
resource "aws_route_table_association" "associate-private2" {
    subnet_id = "${aws_subnet.private2.id}"
    route_table_id = "${aws_route_table.rout_private.id}"
}


