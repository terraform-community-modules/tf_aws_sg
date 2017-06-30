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

// Allow TCP:3306 (MySQL)
resource "aws_security_group_rule" "ingress_tcp_3306_cidr" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["${var.source_cidr_block}"]
}
