resource "tls_private_key" "g_key" {
  algorithm = "RSA"
  rsa_bits = "2048"

}

resource "local_file" "test"{
  content = tls_private_key.g_key.private_key_pem
  filename=" private_key.pem"
  
}

# attachpublic key  them to ec2
resource "aws_key_pair" "deployer" {

 public_key = "${tls_private_key.g_key.public_key_openssh}"
}
