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

    // allow traffic for TCP 22
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 2181
    ingress {
        from_port = 2181
        to_port = 2181
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 2888
    ingress {
        from_port = 2888
        to_port = 2888
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }


    // allow traffic for TCP 7199 (the port we use for zk jmx)
    ingress {
        from_port = 7199
        to_port = 7199
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 3888
    ingress {
        from_port = 3888
        to_port = 3888
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

}
