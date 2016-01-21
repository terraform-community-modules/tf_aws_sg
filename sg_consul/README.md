sg_consul terraform module
==============================

A Terraform security group module for Consul


Ports
-----
- TCP 22
- TCP 8300 (Server RPC)
- TCP 8301 (Serf LAN)
- UDP 8301 (Serf LAN)
- TCP 8400 (Consul RPC)
- TCP 8500 (Consul HTTP API)
- TCP 8600 (Consul DNS)
- UDP 8600 (Consul DNS)

Input Variables
---------------

- `security_group_name` - The name for your security group, e.g. `bluffdale_consul_stage1`
- `vpc_id` - The VPC this security group should be created in.
- `source_cidr_block` - The source CIDR block, defaults to `0.0.0.0/0`
   for this module.

Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_consul" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_consul"
  security_group_name = "${var.security_group_name}-consul"
  vpc_id = "${var.vpc_id}"
  source_cidr_block = "${var.source_cidr_block}"
}
```

2. Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- security_group_name
- vpc_id
- source_cidr_block
