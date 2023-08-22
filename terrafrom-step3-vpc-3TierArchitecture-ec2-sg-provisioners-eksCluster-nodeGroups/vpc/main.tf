# Create VPC Terraform Module
# here we are using another module, vpc, whose source is terraform registry. we can use modules instead of defining everytime. 
#  what this imported module does is, it combines all resources like subnets, gateways, route_tables into one module - vpc
#  this way, by just using one module block - vpc, we are able to define every component relevant to vpc
#  otherwise, we would have to use different recource blocks for every components like :-
#  aws_subnet, aws_db_subnet_group, aws_vpc, aws_route_table, aws_route_table_association etc. 

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"
  #version = "~> 2.78"

  # VPC Basic Details
  name = var.vpc_name
  tags = var.vpc_common_tags
  vpc_tags = var.vpc_common_tags
  
  cidr = var.vpc_cidr_block
  azs             = var.vpc_availability_zones
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets  

  # Database Subnets
  
  database_subnets = var.vpc_database_subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  # create_database_internet_gateway_route = true
  # create_database_nat_gateway_route = true
  
  # NAT Gateways - Outbound Communication
  /*
  Outbound Internet Access: NAT Gateways are primarily used for enabling outbound internet access for resources in private subnets. 
  Resources like EC2 instances in private subnets can't directly communicate with the internet because they don't have public IP addresses. 
  The NAT Gateway provides them with a way to access the internet for tasks like downloading software updates or sending data to external services.
  Static Public IP: A NAT Gateway is associated with an Elastic IP (EIP) address, which provides a static public IP address. 
  NAT Gateways enhance security by controlling outbound traffic from private subnets. 
  They allow you to restrict outbound traffic to only necessary destinations and ports, reducing the attack surface and improving security posture.
  */
  enable_nat_gateway = var.vpc_enable_nat_gateway 
  single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
  }  
  database_subnet_tags = {
    Type = "Private Database Subnets"
  }
}