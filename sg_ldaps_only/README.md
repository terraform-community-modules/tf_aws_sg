sg_ldaps_only terraform module
==============================

A Terraform security group module for just LDAPS, useful for external
ELB instances.


Ports
-----
- TCP 636 (LDAPS)

Input Variables
---------------

- `security_group_name` - The name for your security group, e.g. `bluffdale_web_stage1`
- `vpc_id` - The VPC this security group should be created in.
- `source_cidr_block` - The source CIDR block, defaults to `0.0.0.0/0`
   for this module.

Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_ldaps" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_ldaps_only"
  security_group_name = "${var.security_group_name}-ldaps"
  vpc_id = "${var.vpc_id}"
  source_cidr_block = "${var.source_cidr_block}"
}
```

2. Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- security_group_name
- vpc_id
- source_cidr_block
