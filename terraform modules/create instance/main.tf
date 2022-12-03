provider "aws" { 
  access_key = "---"
  secret_key = "---"
  region = "ap-south-1" 
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "test_ec2"

  ami                    = "ami-0e6329e222e662a52"
  instance_type          = "t2.micro"
  key_name               = "test_key"
  associate_public_ip_address = true
}