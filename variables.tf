variable "region" {
  default = "ap-south-1"
}

variable "ami_id" {
  type = "map"

  default = {
    ap-south-1    = "ami-035b3c7efe6d061d5"
  }
}


# this is source code 
