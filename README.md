tf_aws_sg
======================

A Terraform module which contains a number of common configurations for AWS security groups.
* It assumes you're putting your SGs in a VPC.

Security Group Catalog
----------------------

This module contains the following security group templates for you to use as modules in
service Terraform templates.

- [sg_memcached](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_memcached)
    - It allows incoming TCP 22 (SSH) and TCP 11211 (memcached)
- [sg_web](https://github.com/solarce/terraform-community-modules/tree/master/sg_web) - this is a security group for web applications
    - It allows incoming TCP 22 (SSH), TCP 80 (HTTP), TCP 443 (HTTPS), TCP 8080 (HTTP/S), TCP 1099 (JMX)
- [sg_zookeeper](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_zookeeper) - this is a security group for web applications
    - It Allows incoming TCP 22 (SSH), TCP 2181, TCP 2888, TCP 3888, TCP 7199 (Used for zk JMX)
- [sg_https_only](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_https_only) - This is a security group for external HTTPS ELBs
    - It only allows incoming TCP 443 (HTTPS)
- [sg_consul](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_consul) - This is a security group for Consul clusters
    - It allows incoming TCP 22 (SSH), TCP 8400 (Consul RPC), TCP 8500 (Consul HTTP), TCP/UDP 8600 (Consul DNS)
- [sg_redis](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_redis) - This is a security group for Consul clusters
    - It allows incoming TCP 22 (SSH) and TCP 6379 (redis)
- [sg_kafka](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_kafka) - This is a security group for Kafka clusters
    - It allows incoming TCP 22 (SSH) and TCP 6667 (Kafka broker)


Usage
------

You can use these in your terraform template with the following steps.

1.) Adding a module resource to your template, e.g. `main.tf`

```
module "sg_web" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg-web"
  security_group_name = "${var.security_group_name}-web"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_region = "${var.aws_region}"
  vpc_id = "${var.vpc_id}"
  source_cidr_block = "${var.source_cidr_block}"
}
```

2.) Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- aws_access_key
- aws_secret_key
- aws_region
- security_group_name
- vpc_id
- source_cidr_block

Authors
=======

Created and maintained by [Brandon Burton](https://github.com/solarce)
(brandon@inatree.org).

License
=======

Apache 2 Licensed. See LICENSE for full details.
