// Module specific variables
variable "security_group_name" {
  description = "The name for the security group"
  default = "zipkin"
}

variable "security_group_description" {
  description = "The name for the security group"
  default = "tf-sg-zipkin"
}

variable "vpc_id" {
  description = "The VPC this security group will go in"
}

variable "source_cidr_block" {
  description = "The source CIDR block to allow traffic from"
  default     = ["0.0.0.0/0"]
  type        = "list"
}
