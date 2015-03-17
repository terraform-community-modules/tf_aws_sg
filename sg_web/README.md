sg_web terraform module
=======================

A terraform module with contains rules for a common web application deployment, which 
you can use with your service Terraform template.

Ports
-----
- TCP 22 (SSH)
- TCP 80 (HTTP)
- TCP 443 (HTTPS)
- TCP 1099 (JMX)
- TCP 8080 (HTTP/S)

Input Variables
---------------

- `security_group_name` - The name for your security group, e.g. `bluffdale_web_stage1`
- `vpc_id` - The VPC this security group should be created in.

Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_web" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_web"
  security_group_name = "${var.security_group_name}-web"
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
