resource "aws_db_subnet_group" "tmbDBSubnetGroup" {
  name = "tmb-db-subnet-group"
  subnet_ids = [
    var.tmb_private_subnets[0].id,
    var.tmb_private_subnets[1].id
  ]
  tags = {
    Name    = "tmbDBSubnetGroup"
    Project = "TMB TF Project"
  }
}

resource "aws_security_group" "tmbDBSecurityGroup" {
  name   = "tmb-db-security-group"
  vpc_id = var.tmb_vpc_id

  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"
    cidr_blocks = [
      var.tmb_private_subnet_cidrs[0],
      var.tmb_private_subnet_cidrs[1]
    ]
  }
  tags = {
    Name    = "tmbDBSecurityGroup"
    Project = "TMB TF Project"
  }
}

resource "aws_db_instance" "tmbRDS" {
  availability_zone      = var.db_az
  db_subnet_group_name   = aws_db_subnet_group.tmbDBSubnetGroup.name
  vpc_security_group_ids = [aws_security_group.tmbDBSecurityGroup.id]
  allocated_storage      = 20
  storage_type           = "standard"
  engine                 = "postgres"
  engine_version         = "12"
  instance_class         = "db.t2.micro"
  db_name                = var.db_name
  username               = var.db_user_name
  password               = var.db_user_password
  skip_final_snapshot    = true
  tags = {
    Name    = "tmbRDS"
    Project = "TMB TF Project"
  }
}
