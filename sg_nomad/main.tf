//
// Module: tf_aws_sg/sg_nomad
//
// Nomad ports from https://www.nomadproject.io/docs/agent/config.html
//

// Security Group Resource for Module
resource "aws_security_group" "main_security_group" {
    name = "${var.security_group_name}"
    description = "Security Group ${var.security_group_name}"
    vpc_id = "${var.vpc_id}"

    // allows traffic from the SG itself for tcp
    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        self = true
    }

    // allows traffic from the SG itself for udp
    ingress {
        from_port = 0
        to_port = 65535
        protocol = "udp"
        self = true
    }

    // allow traffic for TCP 22 (SSH)
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 4646 (Nomad HTTP)
    ingress {
        from_port = 4646
        to_port = 4646
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 4647 (Nomad RPC)
    ingress {
        from_port = 4647
        to_port = 4647
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for UDP 8301 (Serf TCP)
    ingress {
      from_port = 4648
      to_port = 4648
      protocol = "tcp"
      cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for UDP 8301 (Serf UDP)
    ingress {
        from_port = 4648
        to_port = 4648
        protocol = "udp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

}
