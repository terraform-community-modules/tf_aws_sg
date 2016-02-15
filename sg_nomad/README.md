sg_nomad terraform module
==============================

A Terraform security group module for Nomad


Ports
-----
- TCP 22
- TCP 4646 (HTTP)
- TCP 4647 (RPC)
- TCP 4648 (Serf)
- UDP 4648 (Serf)

Input Variables
---------------

- `security_group_name` - The name for your security group, e.g. `bluffdale_nomad_stage1`
- `vpc_id` - The VPC this security group should be created in.
- `source_cidr_block` - The source CIDR block, defaults to `0.0.0.0/0`
   for this module.

Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_nomad" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_nomad"
  security_group_name = "${var.security_group_name}-nomad"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_region = "${var.aws_region}"
  vpc_id = "${var.vpc_id}"
  source_cidr_block = "${var.source_cidr_block}"
}
```

2. Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- aws_access_key
- aws_secret_key
- aws_region
- security_group_name
- vpc_id
- source_cidr_block
