user_data = <<-EOF
#!/bin/bash
sudo yum -y update
sudo yum install -y httpd
sudo service httpd start
echo '<!doctype html><html><head><title>CONGRATULATIONS!!.(from tfvars).You are on your way to become a Terraform expert!</title>$
echo "<BR><BR>Terraform autoscaled app multi-cloud lab<BR><BR>" >> /var/www/html/index.html
EOF





/*

Can not use these as variables

count
Source
for_each
version
provider
lifecyles
locals
depends_on


*/

