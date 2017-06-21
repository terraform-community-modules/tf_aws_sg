//
// Module: tf_aws_sg/sg_carbon-relay-ng
//
//

// Security Group Resource for Module
resource "aws_security_group" "main_security_group" {
  name        = "${var.security_group_name}"
  description = "Security Group ${var.security_group_name}"
  vpc_id      = "${var.vpc_id}"

  // allows traffic from the SG itself for tcp
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }

  // allows traffic from the SG itself for udp
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "udp"
    self      = true
  }

  // allow traffic for TCP 22 (SSH)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.source_cidr_block}"]
  }

  // allow traffic for TCP 2003 (for carbon line-in)
  ingress {
    from_port   = 2003
    to_port     = 2003
    protocol    = "tcp"
    cidr_blocks = ["${var.source_cidr_block}"]
  }

  // allow traffic for UDP 2003 (for carbon line-in)
  ingress {
    from_port   = 2003
    to_port     = 2003
    protocol    = "udp"
    cidr_blocks = ["${var.source_cidr_block}"]
  }

  // allow traffic for TCP 2013 (for pickle)
  ingress {
    from_port   = 2013
    to_port     = 2013
    protocol    = "tcp"
    cidr_blocks = ["${var.source_cidr_block}"]
  }

  // allow traffic for UDP 2013 (for pickle)
  ingress {
    from_port   = 2013
    to_port     = 2013
    protocol    = "udp"
    cidr_blocks = ["${var.source_cidr_block}"]
  }

  // allow traffic for TCP 2004 (admin port)
  ingress {
    from_port   = 2004
    to_port     = 2004
    protocol    = "tcp"
    cidr_blocks = ["${var.source_cidr_block}"]
  }

  // allow traffic for TCP 8081 (for GUI)
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["${var.source_cidr_block}"]
  }
}
