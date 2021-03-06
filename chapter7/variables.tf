variable "aws_launchcfg"  {

  description = "aws launch config for ec2 ASG"
  default = "awslaunch"
  type = string 

}

variable "aws_image" {
  description = "amazon linux image for region Ohio"
  type = string
  default = "ami-0a0ad6b70e61be944"

}


variable "awsinstance_type"  {
   description = "aws instance types"
   default = ["t2.micro", "t2.nano", "t2.large" ] 
   type = list
}


variable "instance_security_group_name" {
  description = "The name of security group for EC2 load balanced instances"
  type = string
  default = "terraform-awslaunch-instance"
}


variable "az" {
  default = ["us-east-2b","us-east-2c","us-east-2d"]
}

variable "server_port" {
  default = "80"
  type =  number
}

variable "server_ssh"{
  default = "22"
  type =  number

}

variable "user_data" {
  description = "user data for apache script"
  default = <<-EOF
#!/bin/bash
sudo yum -y update
sudo yum install -y httpd
sudo service httpd start
echo '<!doctype html><html><head><title>CONGRATULATIONS!!..You are on your way to become a Terraform expert!</title><style>body {background-color: #1c87c9;}</style></head><body></body></html>' | sudo tee /var/www/html/index.html
echo "<BR><BR>Terraform autoscaled app multi-cloud lab<BR><BR>" >> /var/www/html/index.html
EOF
}
