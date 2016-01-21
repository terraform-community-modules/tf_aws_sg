//
// Module: tf_aws_sg/sg_cassandra
//
// - Ports for Cassandra taken from http://www.datastax.com/documentation/cassandra/2.0/cassandra/security/secureFireWall_r.html
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

    // allow traffic for TCP 9042 (Cassandra clients)
    ingress {
        from_port = 9042
        to_port = 9042
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 9160 (Cassandra Thrift clients)
    ingress {
        from_port = 9160
        to_port = 9160
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    // allow traffic for TCP 7199 (JMX)
    ingress {
        from_port = 7199
        to_port = 7199
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }
}
