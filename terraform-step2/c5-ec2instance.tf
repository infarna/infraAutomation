# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  # instance_type = var.instance_type
  instance_type = var.instance_type_list[1] # for list
  # instance_type = var.intacne_type_map['prod']
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id   ]
  count = 2  # number of resources to be created using the config provided, it uses indexing starting from 0.
  tags = {
    "Name" = "EC2 Demo 2 -${count.index}" # here the name tag will use the index of count and append it to the name so that every instance will have different name tag. 
  }
}