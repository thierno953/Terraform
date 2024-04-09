data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_key_pair" "existing_key_pair" {
  key_name = "thierno_key"
}

resource "aws_security_group" "tfWebserverSecurityGroup" {
  name        = "allow_ssh_http"
  description = "Allow ssh http inbound traffic"
  vpc_id      = var.tf_vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tfWebserverSecurityGroup"
    Project = "TF Project"
  }
}

resource "aws_lb" "tfLoadBalancer" {
  load_balancer_type = "application"
  subnets            = [var.tf_public_subnets[0].id, var.tf_public_subnets[1].id]
  security_groups    = [aws_security_group.tfWebserverSecurityGroup.id]
  tags = {
    Name    = "tfLoadBalancer"
    Project = "TF Project"
  }
}

resource "aws_lb_listener" "tfLbListener" {
  load_balancer_arn = aws_lb.tfLoadBalancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tfTargetGroup.id
    type             = "forward"
  }
}

resource "aws_lb_target_group" "tfTargetGroup" {
  name     = "tf-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.tf_vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  tags = {
    Name    = "tfTargetGroup"
    Project = "TF Project"
  }
}

resource "aws_lb_target_group_attachment" "webserver1" {
  target_group_arn = aws_lb_target_group.tfTargetGroup.arn
  target_id        = aws_instance.webserver1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "webserver2" {
  target_group_arn = aws_lb_target_group.tfTargetGroup.arn
  target_id        = aws_instance.webserver2.id
  port             = 80
}

resource "aws_instance" "webserver1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = data.aws_key_pair.existing_key_pair.key_name
  subnet_id                   = var.tf_public_subnets[0].id
  security_groups             = [aws_security_group.tfWebserverSecurityGroup.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash -xe
              sudo su 
              apt update -y 
              apt install -y apache2 
              echo "<h1>Hello, World!</h1>server: tfWebServer1" > /var/www/html/index.html 
              echo "healthy" > /var/www/html/hc.html 
              systemctl start apache2
              systemctl enable apache2
              EOF
}

resource "aws_instance" "webserver2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  key_name                    = data.aws_key_pair.existing_key_pair.key_name
  subnet_id                   = var.tf_public_subnets[0].id
  security_groups             = [aws_security_group.tfWebserverSecurityGroup.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash -xe
              sudo su 
              apt update -y 
              apt install -y apache2 
              echo "<h1>Hello, World!</h1>server: tfWebServer2" > /var/www/html/index.html 
              echo "healthy" > /var/www/html/hc.html 
              systemctl start apache2
              systemctl enable apache2
              EOF    
}
