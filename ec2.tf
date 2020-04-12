//public1 instance
resource "aws_instance" "aws_public_instance_1" {
  
  ami           = "ami-0c322300a1dd5dc79" 
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public1.id}"
  key_name = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids =  ["${aws_security_group.allow_http.id}",
                             "${aws_security_group.allow_ssh_private.id}"]
  
  tags = {
    Name = "nginx1"
  }
  
//  provisioners= [
//    {
//      "type": "ansible",
//      "playbook_file": "./playbook.yml"
//    }
//  ]

}

//public2 instance
resource "aws_instance" "aws_public_instance_2" {
  
  ami           =  "ami-0c322300a1dd5dc79" 
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public2.id}"
  key_name = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_http.id}",
                           "${aws_security_group.allow_ssh_private.id}"]
                           
  
  tags = {
    Name = "nginx2"
  }

}



//bastian instance
resource "aws_instance" "aws_public_instance_3" {
  
  ami           =  "ami-0c322300a1dd5dc79" 
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public1.id}"
  key_name = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
                           
  
  tags = {
    Name = "bastian"
  }

}

