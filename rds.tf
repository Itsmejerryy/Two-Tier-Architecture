resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = var.db-username
  password               = sensitive(var.db-password)
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-grp.id
  vpc_security_group_ids = [aws_security_group.db-sg.id]
}