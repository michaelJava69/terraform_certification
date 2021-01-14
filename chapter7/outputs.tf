output "alb_dns_name" {
  value = aws_lb.nlb.dns_name
  description = "The domain name of the loadbalancer"
}



output  "image_id" {
 description = "image id"
 value = aws_launch_configuration.awslaunch.image_id
 

}  
