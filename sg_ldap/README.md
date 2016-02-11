sg_ldap terraform module
=======================

A terraform module with contains rules for an LDAP server, which
you can use with your service Terraform template.

Ports
-----
- TCP 636 (LDAPS)
- TCP 22 (SSH)

Input Variables
---------------

- `security_group_name` - The name for your security group, e.g. `rolodex_ldap`
- `vpc_id` - The VPC this security group should be created in.

Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_ldap" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_ldap"
  security_group_name = "${var.security_group_name}-ldap"
  vpc_id = "${var.vpc_id}"
  source_cidr_block = "${var.source_cidr_block}"
}
```

2. Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- security_group_name
- vpc_id
- source_cidr_block
