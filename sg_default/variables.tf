variable "vpc_id" {}
variable "sg_name" {}
variable "sg_description" {
  default = "Security Group managed by Terraform"
}
variable "inbound_rules" {
  type = "map"
}
variable "outbound_rules" {
  type = "map"
  default = {
    "0" = [ "0.0.0.0/0", "0", "-1" ]
  }
}
variable "tags" {
  type = "map"
}