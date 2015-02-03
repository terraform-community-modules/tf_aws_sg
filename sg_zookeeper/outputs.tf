// Output ID of sg_common SG we made
output "security_group_id_common" {
  value = "${module.sg_common.main_security_group.id}"

// Output ID of sg_zookeeper SG we made
output "security_group_id" {
  value = "${aws_security_group.main_security_group.id}"
}
