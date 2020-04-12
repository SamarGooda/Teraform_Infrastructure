//private1 instance
resource "aws_instance" "aws_private_instance_1" {
  
  ami           = "ami-0c322300a1dd5dc79" 
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.private1.id}"
  key_name = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_private.id}"]
           
  
  tags = {
    Name = "gocd"
  }

}

//private2 instance
resource "aws_instance" "aws_private_instance_2" {
  
  ami           =  "ami-0c322300a1dd5dc79" 
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.private2.id}"
  key_name = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_private.id}"]
                         
  tags = {
    Name = "nodejs"
  }

}
