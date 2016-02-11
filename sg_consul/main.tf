//
// Module: tf_aws_sg/sg_consul
//
// - Ports for Consul take from https://www.consul.io/docs/agent/options.html - Ports Used
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

    // allow traffic for TCP 8300 (Server RPC)
    ingress {
        from_port = 8300
        to_port = 8300
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 8301 (Serf LAN)
    ingress {
        from_port = 8301
        to_port = 8301
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for UDP 8301 (Serf LAN)
    ingress {
        from_port = 8301
        to_port = 8301
        protocol = "udp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 8400 (Consul RPC)
    ingress {
        from_port = 8400
        to_port = 8400
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 8500 (Consul Web UI)
    ingress {
        from_port = 8500
        to_port = 8500
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 8600 (Consul DNS Interface)
    ingress {
        from_port = 8600
        to_port = 8600
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for UDP 8600 (Consul DNS Interface)
    ingress {
        from_port = 8600
        to_port = 8600
        protocol = "udp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }
}
