# VPC Output Values

# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

# # VPC Private Subnets Tags
# output "private_subnets_tags" {
#   description = "List of  private subnets tags"
#   value       = module.vpc.private_subnet.tags
# }

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

# # VPC Private Subnets Tags
# output "public_subnets_tags" {
#   description = "List of   private subnets tags"
#   value       = module.vpc.public_subnets.tags
# }

#  vpc database subnets
output "database_subnets" {
  description = "list of ids of database subnets"
  value = module.vpc.database_subnets
  
}

# # VPC databse  Subnets tags
# output "database_subnet_tags" {
#   description = "List of tags of database subnets"
#   value       = module.vpc.database_subnet.tags
# }


# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

# VPC AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.azs
}