sg_zipkin terraform module
==============================

A Terraform security group module for Zipkin


Ports
-----
- TCP 9990 (zipkin admin port collector)
- TCP 9901 (zipkin admin port query)
- TCP 9991 (zipkin admin port zipkin)
- TCP 9411 (zipkin query port)
- TCP 8080 (zipkin web port)


Input Variables
---------------

- `security_group_name` - The name for your security group, e.g. `bluffdale_zipkin_stage1`
- `security_group_description` - The description of your security group, e.g. `tf-sg-bluffdale_zipkin_stage1`
- `vpc_id` - The VPC this security group should be created in.
- `source_cidr_block` - The source CIDR block, defaults to `0.0.0.0/0`
   for this module.

Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_zipkin" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_zipkin"
  security_group_name = "${var.security_group_name}-zipkin"
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
