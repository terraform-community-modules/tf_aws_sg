// Security Group Resource for Module
resource "aws_security_group" "main_security_group" {
  name        = "${var.security_group_name}"
  description = "Security Group ${var.security_group_name}"
  vpc_id      = "${var.vpc_id}"
}

// Allow TCP:443 (HTTPS).
resource "aws_security_group_rule" "ingress_tcp_443_cidr" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["${var.source_cidr_block}"]
  type              = "ingress"
}
