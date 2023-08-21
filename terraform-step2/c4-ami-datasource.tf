# Get latest AMI ID for Amazon Linux2 OS
/* this information is obtained from the documentation 
by getting the example usage - Datasource aws_ami
similar to any resource block, data block is there followed by datasource type and local name */

/* the filters here contain two fileds, name and value
name is the name of the data resource attribute and value is its value. */
/* every data source has its own set of argutments and attributes and filters can be used based on that */

data "aws_ami" "amzlinux2" {
  most_recent      = true
  owners           = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_availability_zones" "us-east-1" {
  filter {
    name = "opt-in-status"
    values = ["opt-in-not-required"]
  }
  
}