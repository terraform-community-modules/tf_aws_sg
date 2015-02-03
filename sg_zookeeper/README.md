sg_zookeeper terraform module
=======================

A terraform module with contains rules for a zookeeper_cluster

Ports
-----

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
  source = "github.com/solarce/tf_aws_sg//sg-zookeeper"
  security_group_name = "${var.security_group_name}-zookeeper"
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
