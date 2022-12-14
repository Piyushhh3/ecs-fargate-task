

output "rds_address" {
  value = "${aws_db_instance.rds.address}"
}

output "db_access_sg_id" {
  value = "${aws_security_group.db_access_sg.id}"
}

output "db_name" {
  value = "${aws_db_instance.rds.db_name}"
}

output "username" {
  value = "${aws_db_instance.rds.username}"
}

output "identifiere" {
  value = "${aws_db_instance.rds.identifier}"
}
