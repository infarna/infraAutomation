#  This is the main terrafom file for the project. This is where all the modules can be called.
#  any relevant information/value which is declared in the root module which need to bassed to individula modules should be passed here as below. 
#  the variables should be declared in the specific  module's variables.tf, only then they can be used here,  No new variable can be declared here. 

module "vpc" {
    source = "./vpc"
    # vpc_owners is defined in root/vpc/variables.tf file => variable "vpc_owners" {}
    vpc_owners = local.owners
    # vpc_environment is defined in root/vpc/variables.tf file => variable "vpc_environment" {}
    vpc_environment = local.environment
    # vpc_name is defined in root/vpc/variables.tf file => variable "vpc_name" {variable "vpc_name" {  description = "VPC Name"   type = string   default = "myvpc" }}
    vpc_name = local.name
    # vpc_common_tags is defined in root/vpc/variables.tf file => variable "vpc_common_tags" {}
    vpc_common_tags = local.common_tags
  
}