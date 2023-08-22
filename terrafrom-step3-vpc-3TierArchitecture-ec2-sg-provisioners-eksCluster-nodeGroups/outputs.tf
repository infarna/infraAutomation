# the outputs declared in modules (like vpc module here) will not be captured directly if execution is done from root module. 
# Below is to be done to extract outputs from modules into root module.

# Reference all outputs from the vpc module at once
output "vpc_outputs" {
  value = module.vpc
}
