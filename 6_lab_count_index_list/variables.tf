variable "instancelist" {
  type = list(any)
  default = [
    "m5.large",
    "m5.xlarge",
    "t2.medium"
  ]
}

variable "instancemap" {
  type = map(any)
  default = {
    us-east-1  = "t2.micro"
    us-west-2  = "t2.nano"
    ap-south-1 = "t2.small"

  }

}

variable "count_name" {
  type = list
  default = [
    "dev_count", 
    "qa_count", 
    "prod_count"
  ]
}