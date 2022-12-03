provider "aws" { 
  access_key = "---"
  secret_key = "---"
  region = "ap-south-1" 
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name= "test-vpc"
  cidr ="10.0.0.0/16"

  azs      = ["ap-south-1a"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
}



module "ec2_instance" {
  source= "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name= "test_ec2"
  ami= "ami-0e6329e222e662a52"
  instance_type= "t2.micro"
  key_name = "test_key"
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids= [module.vpc.default_security_group_id]
  associate_public_ip_address = true
}
