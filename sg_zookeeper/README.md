sg_zookeeper terraform module
=======================

A terraform module with contains rules for a zookeeper_cluster

Ports
-----

- TCP 22 (SSH)
- TCP 2181
- TCP 2888
- TCP 3888
- TCP 7199 (JMX we use for Zookeeper)

Input Variables
---------------

- `security_group_name` - The name for your security group.
- `vpc_id` - The VPC this security group should be created in.

Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_zookeeper" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_zookeeper"
  security_group_name = "${var.security_group_name}-zookeeper"
  vpc_id = "${var.vpc_id}"
  source_cidr_block = "${var.source_cidr_block}"
}
```

2. Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- security_group_name
- vpc_id
- source_cidr_block
