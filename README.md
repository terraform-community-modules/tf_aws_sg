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
- [sg_web](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_web) - this is a security group for web applications
    - It allows incoming TCP 22 (SSH), TCP 80 (HTTP), TCP 443 (HTTPS), TCP 8080 (HTTP/S), TCP 1099 (JMX)
- [sg_zookeeper](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_zookeeper) - this is a security group for zookeeper
    - It Allows incoming TCP 22 (SSH), TCP 2181, TCP 2888, TCP 3888, TCP 7199 (Used for zk JMX)
- [sg_https_only](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_https_only) - This is a security group for external HTTPS ELBs
    - It only allows incoming TCP 443 (HTTPS)
- [sg_consul](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_consul) - This is a security group for Consul clusters
    - It allows incoming TCP 22 (SSH), TCP 8300 (Server RPC), TCP 8301 (Serf LAN), and UDP 8301 (Serf LAN)
    - It allows incoming TCP 8400 (Consul RPC), TCP 8500 (Consul HTTP), TCP 8600 (Consul DNS), and UDP 8600 (Consul DNS)
- [sg_redis](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_redis) - This is a security group for Redis clusters
    - It allows incoming TCP 22 (SSH) and TCP 6379 (redis)
- [sg_kafka](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_kafka) - This is a security group for Kafka clusters
    - It allows incoming TCP 22 (SSH), TCP 6667 (Kafka broker) TCP 9092 (Kafka broker)
- [sg_cassandra](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_cassandra) - This is a security group for Cassandra clusters
    - It allows incoming TCP 22 (SSH), TCP 7199 (JMX), 9042 (Cassandra clients), 9160 (Cassandra Thrift clients)
- [sg_mysql](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_mysql) - This is a security group for MySQL
    - It allows incoming TCP 22 (SSH), TCP 3306 (MySQL)
- [sg_elasticsearch](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_elasticsearch) - This is a security group for ElasticSearch
    - It allows incoming TCP 22 (SSH), TCP 9200 (REST Interface), 9300 (Java Interface)
- [sg_storm](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_storm) - This is a security group for Apache Storm Cluster
    - It allows incoming TCP 22 (SSH), TCP 6627 (Default Nimbus port), TCP 8080 (Storm UI), TCP 6700, 6701, 6702, 6703 (Default Supervisor port)
- [sg_zipkin](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_zipkin) - This is a security group for Zipkin
    - It allows incoming TCP 22 (SSH), TCP 9990 (zipkin admin port collector), TCP 9901 (zipkin admin port query)
    - It allows TCP 9991 (zipkin admin port web), TCP 9411 (zipkin query port), TCP 8080 (zipkin web port)
- [sg_ldap](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_ldap) - This is a security group for LDAP
    - It allows incoming TCP 22 (SSH)
    - It allows incoming TCP 636 (LDAPS)
- [sg_ldaps_only](https://github.com/terraform-community-modules/tf_aws_sg/tree/master/sg_ldaps_only) - This is a security group for LDAPS only
    - It allows incoming TCP 636 (LDAPS)


Usage
------

You can use these in your terraform template with the following steps.

1.) Adding a module resource to your template, e.g. `main.tf`

```
module "sg_web" {
  source = "github.com/terraform-community-modules/tf_aws_sg//sg_web"
  security_group_name = "${var.security_group_name}-web"
  vpc_id = "${var.vpc_id}"
  source_cidr_block = "${var.source_cidr_block}"
}
```

2.) Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

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
