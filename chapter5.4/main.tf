
provider "aws" {
  region  = "us-east-2"
  version = "~> 2.0"
}


provider "aws" {
  alias   = "califonia"
  region  = "us-east-2"
  version = "~> 2.0"
}



terraform {
  required_version = ">= 0.12, < 0.13"

}


## workspace example   / old local provisioner 

resource "aws_instance" "import_example" {

  provider = aws
  ami           = "ami-0a0ad6b70e61be944"
  instance_type = terraform.workspace ==  "default" ? "t2.medium" : "t2.micro"

  tags = {
    Name = "example-in-workspace-${terraform.workspace}"
  }



  /*
  provisioner "local-exec" {
    command = " echo ${self.id}  >> michael.txt"
  }
 */

}


