provider "aws" {}


resource "aws_instance" "my_Ubuntu" {
  ami           = "ami-0f5fcdfbd140e4ab7"
  instance_type = "t3.micro"

  tags = {
    Name    = "My Ubuntu Server"
    Owner   = "Sergei Chesnokov"
    Project = "Terraform Lessons"
  }
}

resource "aws_instance" "my_RedHat" {
  ami           = "ami-0912d5cf1d5dff99c"
  instance_type = "t3.micro"

  tags = {
    Name    = "My RedHat Server"
    Owner   = "Sergei Chesnokov"
    Project = "Terraform Lessons"
  }
}
