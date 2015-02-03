tf_aws_sg aka the terraform_module_aws_security_group
===================================

A Terraform module which contains a number of common configurations for AWS security groups.

Security Group Catalog
----------------------

This module contains the following security group templates for you to use as modules in
service Terraform templates.

- `sg_common` - this is a security group that all systems should use.
    - It allows incoming TCP 22 (SSH)
- `sg_web` - this is a security group for web applications
    - It allows incoming TCP 80 (HTTP), TCP 443 (HTTPS), TCP 8080 (HTTP/S), TCP 1099 (JMX)

Usage
------

You can use these in your terraform template by adding code like what is shown below

```
module "vpc" {
  source = "source.flexilis.local/terraform_module_aws_security_group/sg_web"
  vpc_id = ${var.vpc_id}
  // the network you're allowing traffic from
  network = "${var.network}"
}
``` 
