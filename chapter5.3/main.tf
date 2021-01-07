
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

resource "aws_instance" "import_example" {
  provider = aws
  ami = "ami-0a0ad6b70e61be944"
  instance_type = "t2.micro"

  tags = {
     Name = "Import example"
  }

 /*
  provisioner "local-exec" {
    command = " echo ${self.id}  >> michael.txt"
  }
 */

}


