provider "aws" {}


resource "aws_instance" "my_Ubuntu" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t3.micro"

  tags = {
    Name    = "My Ubuntu Server"
    Owner   = "Sergei Chesnokov"
    Project = "Terraform Lessons"
  }
}

resource "aws_instance" "my_RedHat" {
  ami           = "ami-069e612f612be3a2b"
  instance_type = "t3.micro"

  tags = {
    Name    = "My RedHat Server"
    Owner   = "Sergei Chesnokov"
    Project = "Terraform Lessons"
  }
}
