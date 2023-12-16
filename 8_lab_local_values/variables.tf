variable "instancelist" {
  type = list(any)
  default = [
    "t2.large",
    "t2.micro",
    "t2.medium"
  ]
}

variable "count_name" {
  type = list(any)
  default = [
    "dev_count",
    "qa_count",
    "prod_count"
  ]
}

variable "istest" {

}
# locals {
#   # Common tags to be assigned to all resources
#   common_tags = {
#     Service = "Terraform"
#     Owner   = "Julie"
#   }
# }