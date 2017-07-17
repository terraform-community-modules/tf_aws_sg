# sg_default terraform module
A terraform module which contains default rules to create a specific security group.
## Input Variables
* sg_name - The name for your security group, e.g. bluffdale_web_stage1
* vpc_id - The VPC this security group should be created in.
* sg_description - The description for your security group.
* inbound_rules - A map that contains the inbound rules for the security group.
* outbound_rules - A map that contains the outbound rules for the security group.
* tags - A map that contains the tags for the security group.
## Output Variables
* sg_id - The security group ID.
## Usage 
You can use these in your terraform template with the following steps.
1. Adding a module resource to your template, e.g. main.tf
```
module "f31_head_elb_sg" {
  source = "https://github.com/ltartarini90/terraform-aws-modules/tree/master/sg_default"
  sg_name = "${var.sg_name}"
  vpc_id = "${var.vpc_id}"
  
  ### Inbound rules ###
  inbound_rules = {
    "0" = [ "${var.source_cidr_block}", "80", "TCP" ]
    "1" = [ "${var.source_cidr_block}", "443", "TCP" ]
  }
  
  ### Outbound rules ###  
  # outbound_rules = {
    "0" = [ "0.0.0.0/0", "0", "-1" ]
  # }

  ### Tags ###  
  tags = {
  }
}
```
2. Setting values for the following variables, either through terraform.tfvars or -var arguments on the CLI
* sg_name
* vpc_id
* inbound_rules
* outbound_rules
* tags
