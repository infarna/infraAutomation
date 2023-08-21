# multiple EC2 Instance using list
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  # instance_type = var.instance_type
  instance_type = var.instance_type_list[1] # for list
  # instance_type = var.intacne_type_map['prod'] # for map
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id   ]
  # count = 3  # number of resources to be created using the config provided, it uses indexing starting from 0.
  # The "count" and "for_each" meta-arguments are mutually-exclusive, only one should be used to be explicit about the│ number of resources to be created.
  # create ec2 instance in different availability zone
  # the for_each here is a meta argument. It accepts only map/dict or set of strings. check documentation
  # toset function in terraform does below- 
  # removes duplicates, check for datatypes and converts all element in one datatype based on which dataype is for maximum elements
  # so when a list of AZ is provided to toset function it return as set of strings which is used by for_each
  # for_each = toset(data.aws_availability_zones.us-east-1.names)
  # adding a new for each as now we have the filtered set of azs in which any desired instance_type is present in the output dynamically_filtered_azs
  # using the same calculation and puting it into a set for for_each to consume
  for_each = toset(keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type:
      az => details.instance_types
      if length(details.instance_types) != 0
    }))


  # when you use for_each with set of strings, the item of the for_each can be accessed by using 'each.key'
  availability_zone = each.key
   tags = {
    "Name" = "For-Each-Demo-${each.key}" # here the name tag will use each.key to get correcpponding az and append it to the name so that every instance will have different name tag. 
  }
}

# # Multiple EC2 Instance using map
# resource "aws_instance" "myec2vm_map" {
#   ami = data.aws_ami.amzlinux2.id
#   # instance_type = var.instance_type
#   # instance_type = var.instance_type_list[1] # for list
#   instance_type = var.instance_type_map["prod"]
#   user_data = file("${path.module}/app1-install.sh")
#   key_name = var.instance_keypair
#   vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id   ]
#   count = 2  # number of resources to be created using the config provided, it uses indexing starting from 0.
#   tags = {
#     "Name" = "EC2 Maps -${count.index}" # here the name tag will use the index of count and append it to the name so that every instance will have different name tag. 
#   }
# }