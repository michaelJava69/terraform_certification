
variable "user_names" {
 
   description  = "IAM users to be created with thes enames"
   type         = list(string)
   default      = ["neo"  , "trinity", "morpheous" ]

}
