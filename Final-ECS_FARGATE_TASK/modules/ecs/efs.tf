
resource "aws_efs_file_system" "efs" {
  creation_token = "efs-wp"
  encrypted = "true"

tags = {
     Name = "TF-EFS"
   }
}
resource "aws_efs_mount_target" "efs" {
  count = 2

  file_system_id = "${aws_efs_file_system.efs.id}"
  subnet_id      =  var.public_subnet[count.index]
  security_groups = [ aws_security_group.efs.id ]
}