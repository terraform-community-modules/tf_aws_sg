//
// Module: tf_aws_sg/sg_zipkin
//
// - Ports for Zipkin
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

    // allow traffic for TCP 9990 (zipkin admin port collector)
    ingress {
        from_port = 9990
        to_port = 9990
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 9901 (zipkin admin port query)
    ingress {
        from_port = 9901
        to_port = 9901
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for UDP 9991 (zipkin admin port web)
    ingress {
        from_port = 9991
        to_port = 9991
        protocol = "udp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 9411 (zipkin query port)
    ingress {
        from_port = 9411
        to_port = 9411
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 8080 (zipkin web port)
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }
}
