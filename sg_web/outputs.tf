// Output ID of sg_common SG we made
output "security_group_id_common" {
  value = "${module.sg_common.main_security_group.id}"

// Output ID of sg_web SG we made
output "security_group_id_web" {
  value = "${aws_security_group.main_security_group.id}"
}
