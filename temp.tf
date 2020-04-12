data "template_file" "open_ssh" {
  template = file("${path.module}/templates/ssh_config.cfg")
  vars = {
    bastion_ip = aws_instance.aws_public_instance_3.public_ip
  }
}
resource "null_resource" "ssh" {
 triggers = {
     template_rendered=data.template_file.open_ssh.rendered
 }
  provisioner "local-exec" {
    command = "echo '${data.template_file.open_ssh.rendered}'> ~/.ssh/config ; chmod 400 ~/.ssh/config"
        
  }
} 
 