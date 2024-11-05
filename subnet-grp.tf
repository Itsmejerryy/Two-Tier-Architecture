resource "aws_db_subnet_group" "db-subnet-grp" {
  name       = "rds-subnet-grp"
  subnet_ids = [aws_subnet.private-subnet-1a.id, aws_subnet.private-subnet-1b.id]

  tags = {
    Name = "My DB subnet group"
  }
}