//
// Module: tf_aws_sg/sg_nomad
//
// Nomad ports from https://www.nomadproject.io/docs/agent/config.html
//

// Security Group Resource for Module
resource "aws_security_group" "main_security_group" {
  name        = "${var.security_group_name}"
  description = "Security Group ${var.security_group_name}"
  vpc_id      = "${var.vpc_id}"
}

// Allow any internal network flow.
resource "aws_security_group_rule" "ingress_any_any_self" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  self              = true
}

// Allow TCP:4646 (Nomad HTTP)
resource "aws_security_group_rule" "ingress_tcp_4646_cidr" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 4646
  to_port           = 4646
  protocol          = "tcp"
  cidr_blocks       = ["${var.source_cidr_block}"]
}

// Allow TCP:4647 (Nomad RPC)
resource "aws_security_group_rule" "ingress_tcp_4647_cidr" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 4647
  to_port           = 4647
  protocol          = "tcp"
  cidr_blocks       = ["${var.source_cidr_block}"]
}

// Allow TCP:4648 (Serf)
resource "aws_security_group_rule" "ingress_tcp_4648_cidr" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 4648
  to_port           = 4648
  protocol          = "tcp"
  cidr_blocks       = ["${var.source_cidr_block}"]
}

// Allow UDP:4648 (Serf)
resource "aws_security_group_rule" "ingress_udp_4648_cidr" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 4648
  to_port           = 4648
  protocol          = "udp"
  cidr_blocks       = ["${var.source_cidr_block}"]
}
