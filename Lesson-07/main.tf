#----------------------------------------------------------
# Terraform Web Server
# Build WebServer during Bootstrap
# Made by Sergei Chesnokov
#----------------------------------------------------------

provider "aws" {
  region = "us-east-1"
}

# Default VPC
resource "aws_default_vpc" "default" {}

# Security Group
resource "aws_security_group" "my_webserver" {
  name        = "WebServer-SG"
  description = "Allow SSH, HTTP, HTTPS"
  vpc_id      = aws_default_vpc.default.id

  dynamic "ingress" {
    for_each = [22, 80, 443]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "WebServer-SG"
    Owner = "Sergei Chesnokov"
  }
}

# EC2 Instance
resource "aws_instance" "my_webserver" {
  ami           = "ami-069e612f612be3a2b" # RHEL
  instance_type = "t3.micro"
  key_name      = "ssh_new_redhat"

  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Sergei"
    l_name = "Chesnokov"
    names  = ["Vasya", "Kolya", "Petya", "John", "Donald", "Masha", "Lena", "Katya"]
  })

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name  = "Terraform-WebServer"
    Owner = "Sergei Chesnokov"
  }
}

# Elastic IP
resource "aws_eip" "web_eip" {
  domain = "vpc"

  tags = {
    Name  = "WebServer-EIP"
    Owner = "Sergei Chesnokov"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.my_webserver.id
  allocation_id = aws_eip.web_eip.id
}
