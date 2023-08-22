# Define Local Values in Terraform
#  the values here canbe used anywhere provided proper refrencing. 
# the values can be hard coded or can be refrenced from variables.tf of root folder.

locals {
  owners = var.business_divsion
  environment = var.environment
  name = "${var.business_divsion}-${var.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
} 