resource "aws_db_subnet_group" "db_subnet" {
  subnet_ids = [aws_subnet.private_db.id]
}

resource "aws_db_instance" "db" {
  engine            = var.db_engine
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage

  db_name  = "appdb"
  username = var.db_username
  password = var.db_password

  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name

  skip_final_snapshot = true
}