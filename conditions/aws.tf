
## stone age

/*

resource "aws_iam_user"  "example" {

   count = 3
   name = "neo.${count.index}"

}

*/




##    The best way to look a count if you want to maintain intergrity is
##    *** for_each  Expression  *****



## old way

/*
resource "aws_iam_user"  "example2"  {

    count = length(var.user_names)
    name  = var.user_names[count.index]
}

*/



## better way
  /*
     toset conversts list to a set
     for each supports sets and maps only
          loops over set making each value available in each.key

     We will now have a map of resources   rather than an array of resources

  */


resource "aws_iam_user"  "example3"  {
    for_each = toset(var.user_names)
        name  = each.value
}


## another advantage of for each loop


