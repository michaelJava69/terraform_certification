
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
 
  provisioner "local-exec" {
    command = " echo ${self.id}  >> michael.txt"
  }

}


## remote-exec provisioner

/*

resource "aws_instance" "example" {
  provider = aws.califonia

  ami = "ami-0bcc094591f354be2"
  instance_type = "t2.micro"
}

*/

resource "aws_instance" "example" {
  provider = "aws.califonia"
  ami = data.aws_ami.ami.id
  ## ami = "ami-0bcc094591f354be2"
  availability_zone = "us-east-2b"
  key_name = aws_key_pair.ssh.key_name
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.prov_fw.id]

/*
  ##  could configure remote exec here
  
    connection {
      type = "ssh"
      host = aws_instance.example.public_ip
      private_key = file("~/certification/keypair/chapter5.pem")
      user = "ec2-user"
      timeout = "1m"
    }
    provisioner "remote-exec" {
      inline = [
        "sudo yum -y update",
        "sudo yum install -y httpd",
        "sudo service httpd start",
        "echo '<!doctype html><html><body><h1>CONGRATS!!..You have configured successfully your remote exec provisioner!</h1></body></html>' | sudo tee /var/www/html/index.html"]
    }
*/
  
}

## remote-exec
resource "aws_key_pair" "ssh"{
    key_name = "provkey"
    public_key = file("~/certification/keypair/chapter5.pub")
    ## copy the generated public key into the ~/.ssh/ autherized_keyson the ec2 instance directory   allowing you to use key provkey
}

## remote-exec
resource "aws_security_group" "prov_fw" {
  name = "prov_fw"

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ## leave everything open
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "null_resource" "prov_null" {
  triggers = {
    public_ip = aws_instance.example.public_ip
  }

  connection {
    type = "ssh"
    host = aws_instance.example.public_ip   ## this is where i want to execute the script
    ## private_key = file("~/.ssh/id_rsa") ##please input path to your private key
    ## only use above if go and iport provate jey into ec2 https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#prepare-key-pair
    
    # test failure

    private_key = file("~/certification/keypair/chapter5.pem")  ## path to generated pem key
    user = "ec2-user"
    timeout = "1m"
  }

  provisioner "remote-exec" {
    inline = ["sudo yum -y update",
      "sudo yum install -y httpd",
      "sudo service httpd start",
      "echo '<!doctype html><html><body><h1>CONGRATS!!..You have configured successfully your remote exec provisioner!</h1></body></html>' | sudo tee /var/www/html/index.html"
    ]
  }
}



## https://registry.terraform.io/providers/hashicorp/aws/latest/docs
## 0.13

/*
terraform {
  required_providers {
    aws = {
      region ="us-east-1"
      version= "~> 2.0"  
    }
  }

}

*/
