provider "aws" {
  region = "us-east-2"
  version = "~> 2.0"
}

resource "aws_instance" "myvm"{
     ami = "ami-0a0ad6b70e61be944"
     instance_type = "t2.micro"

     tags = {
       Name = "ec2-import"
     }

}
