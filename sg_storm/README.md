sg_storm terraform module
==============================

A Terraform security group module for Apache Storm Cluster


Ports
-----
- TCP 22
- TCP 6627 (Default Nimbus port)
- TCP 8080 (Storm UI)
- TCP 6700, 6701, 6702, 6703 (Default Supervisor port)

Input Variables
---------------

- `security_group_name` - The name for your security group, e.g. `bluffdale_storm_stage1`
- `vpc_id` - The VPC this security group should be created in.
- `source_cidr_block` - The source CIDR block, defaults to `0.0.0.0/0`
   for this module.

Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_storm" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_storm"
  security_group_name = "${var.security_group_name}-storm"
  vpc_id = "${var.vpc_id}"
  source_cidr_block = "${var.source_cidr_block}"
}
```

2. Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- security_group_name
- vpc_id
- source_cidr_block
