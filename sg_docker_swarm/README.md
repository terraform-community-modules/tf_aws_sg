sg_docker_swarm terraform module
==============================

A Terraform security group module for Docker Swarm Nodes


Ports
-----
- TCP 2377 (Swarm management communication)
- TCP 7946 (Swarm node communication)
- UDP 7946 (Swarm node communication)
- UDP 4789 (Swarm overlay network communication)

Input Variables
---------------

- `security_group_name` - The name for your security group, e.g. `banach_docker_swarm`
- `vpc_id` - The VPC this security group should be created in.
- `source_cidr_block` - The source CIDR block, defaults to `0.0.0.0/0`
   for this module.
   
Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_docker_swarm" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_docker_swarm"
  security_group_name = "${var.security_group_name}-openvpn"
  vpc_id = "${var.vpc_id}"
  source_cidr_block = ["${var.source_cidr_block}"]
}
```

2. Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- security_group_name
- vpc_id
- source_cidr_block