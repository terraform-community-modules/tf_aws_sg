sg_openvpn terraform module
===========================

A terraform module which contains rules for a OpenVPN server, which 
you can use with your service Terraform template.

Ports
-----
- UDP 1194 (OpenVPN)


Input Variables
---------------

- `security_group_name` - The name for your security group, e.g. `rolodex_openvpn`
- `security_group_description` - The description of your security group, e.g. `tf-sg-rolodex_openvpn_stage1`
- `vpc_id` - The VPC this security group should be created in.

Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_openvpn" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_openvpn"
  security_group_name = "${var.security_group_name}-openvpn"
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
