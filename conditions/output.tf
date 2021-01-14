
/*
output "iam_names2" {
  value =  aws_iam_user.example2[*].arn

}

*/


/*

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

iam_names = [
  "arn:aws:iam::051102736698:user/neo",
  "arn:aws:iam::051102736698:user/trinity",
  "arn:aws:iam::051102736698:user/morpheous",
]

*/

## the whole map

output "iam_names3" {
  value =  aws_iam_user.example3

}



/*

Outputs:

iam_names3 = {
  "morpheous" = {
    "arn" = "arn:aws:iam::051102736698:user/morpheous"
    "force_destroy" = false
    "id" = "morpheous"
    "name" = "morpheous"
    "path" = "/"
    "unique_id" = "AIDAQXZPV4E5ALVOJH5YZ"
  }
  "neo" = {
    "arn" = "arn:aws:iam::051102736698:user/neo"
    "force_destroy" = false
    "id" = "neo"
    "name" = "neo"
    "path" = "/"
    "unique_id" = "AIDAQXZPV4E5IC2LRAH34"
  }
  "trinity" = {
    "arn" = "arn:aws:iam::051102736698:user/trinity"
    "force_destroy" = false
    "id" = "trinity"
    "name" = "trinity"
    "path" = "/"
    "unique_id" = "AIDAQXZPV4E5B6MUS2AOU"
  }
}

*/


## the arns

output "iam_names4" {

   value =  values(aws_iam_user.example3)[*].arn

}


##  iam ids

output "call_this_anything" {

   value =  values(aws_iam_user.example3)[*].id

}



