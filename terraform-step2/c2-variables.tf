# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instnace Type"
  type = string
  default = "t3.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
  default = "terraform-key"
}

# Multiple AWS EC2 Instance  - using  variable type List,
# this will actually create a list named instance_type_list = ["t3.micro", "t3.small", "t3.large"]
# it can be access as any regular list using indexes
variable "instance_type_list" {
  description = "EC2 Instance Type"
  type = list(string)
  default = ["t3.small", "t3.micro", "t3.large"]  
}

# Multiple AWS EC2 Instance  - using variable type Map
# Multiple AWS EC2 Instance  - using  variable type map, can also be considered as  dict,
# this will actually create a map/dict  named instance_type_map = {"dev":"t3.micro", "qa":"t3.small", "prod" : "t3.large"}
# it can be access as any regular dict  using key names ex:- intacne_type_map['prod']
variable "instance_type_map" {
  description = "EC2 Instance Type"
  type = map(string)
  # below is the map dataype of terraform
  default = {
    "dev" = "t3.micro"
    "qa" = "t3.small"
    "prod" = "t3.large"
  }
}