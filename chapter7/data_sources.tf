data "aws_availability_zones" "azs" {
  state = "available"

  filter {
    name = "zone-name"
    values = ["us-east-2*"]
  }
}



data "aws_ami" "amazonlinux" {
   ownwers = []

}
