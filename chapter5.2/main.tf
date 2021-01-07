
provider "aws" {
  region = "us-east-2"
  version = "~> 2.0"
}


provider "aws" {
  alias = "califonia"
  region = "us-east-2"
  version = "~> 2.0"
}

provider "azurerm" {
  version = "~> 2.40"
  features {}
}


terraform {
  required_version = ">= 0.12, < 0.13"

}


## local-exec provisioner

resource "aws_instance" "example2" {
  provider = aws
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
     Name = "ec2-${terraform.workspace}"
  }
 
  provisioner "local-exec" {
    command = " echo ${self.id}  >> michael.txt"
  }

}


