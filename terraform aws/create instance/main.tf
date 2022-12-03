terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" { 
  access_key = "---"
  secret_key = "---"
  region = "ap-south-1" 
}

resource "aws_instance" "terraform-identifier" {
  ami = "ami-0e6329e222e662a52"
  count = 1
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "test_key"

  tags = {
    Name = "tf-marketing-${count.index}"
  }

}