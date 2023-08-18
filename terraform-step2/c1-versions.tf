# Terraform Block
terraform {
  required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = { # this is the local name of the provider, it can be anything, not necessarily aws. Just note that it is refered in the block below and should match. 
      source = "hashicorp/aws" # here the registry name is not mentioned as by default it takes hashicorp registry, if any other registry is needed, mention registry
      version = "~> 3.0"
    }
  } 
}  
# Provider Block - the block lable here "aws" should be same as the name of the provider provided in the required_provider block
provider "aws" {
  region = "us-east-1"
}

/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
