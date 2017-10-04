sg_carbon-relay-ng terraform module
==============================

A Terraform security group module for carbon-relay-ng


Ports
-----
- TCP 2003 (carbon-relay-ng carbon line-in)
- UDP 2003 (carbon-relay-ng carbon line-in)
- TCP 2013 (carbon-relay-ng carbon pickle)
- UDP 2013 (carbon-relay-ng carbon pickle)
- TCP 8081 (carbon-relay-ng carbon GUI)
- TCP 2004 (carbon-relay-ng carbon admin port)


Input Variables
---------------

- `security_group_name` - The name for your security group, e.g. `bluffdale_carbon-relay-ng_stage1`
- `security_group_description` - The description of your security group, e.g. `tf-sg-bluffdale_carbon-relay-ng_stage1`
- `vpc_id` - The VPC this security group should be created in.
- `source_cidr_block` - The source CIDR block, defaults to `0.0.0.0/0`
   for this module.

Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_carbon-relay-ng" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_carbon-relay-ng"
  security_group_name = "${var.security_group_name}-carbon-relay-ng"
  security_group_description = "${var.security_group_description}"
  vpc_id = "${var.vpc_id}"
  source_cidr_block = ["${var.source_cidr_block}"]
}
```

2. Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- security_group_name
- security_group_description
- vpc_id
- source_cidr_block
