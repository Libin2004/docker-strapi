provider "aws" {
  region = var.region
}

resource "aws_instance" "strapi_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.strapi_sg.id]

  user_data = file("user-data.sh")

  tags = {
    Name = "Strapi-Docker-Server"
  }
}
