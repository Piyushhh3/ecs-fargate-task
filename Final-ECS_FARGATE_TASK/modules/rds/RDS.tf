
resource "aws_db_instance" "rds" {
  identifier             = var.dbname-identifier
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "5.7"
  db_name                = var.dbname
  instance_class         = var.dninstance
  username               = var.usern
  password               = var.passwd
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.id
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot    = true


}