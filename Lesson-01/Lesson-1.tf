provider "aws" {}


resource "aws_instance" "my_Ubuntu" {
  ami           = "ami-090f10efc254eaf55"
  instance_type = "t3.micro"

  tags = {
    Name    = "My Ubuntu Server"
    Owner   = "Denis Astahov"
    Project = "Terraform Lessons"
  }
}

resource "aws_instance" "my_Amazon" {
  ami           = "ami-0912d5cf1d5dff99c"
  instance_type = "t3.micro"

  tags = {
    Name    = "My RedHat Server"
    Owner   = "Sergei Chesnokov"
    Project = "Terraform Lessons"
  }
}
