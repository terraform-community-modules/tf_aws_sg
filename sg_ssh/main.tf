// Security Group Resource for Module
resource "aws_security_group" "main_security_group" {
  name        = "${var.security_group_name}"
  description = "Security Group ${var.security_group_name}"
  vpc_id      = "${var.vpc_id}"
}

// Allow TCP:22 (SSH)
resource "aws_security_group_rule" "ingress_tcp_22_cidr" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = "${var.source_cidr_block}"
  type              = "ingress"
}
