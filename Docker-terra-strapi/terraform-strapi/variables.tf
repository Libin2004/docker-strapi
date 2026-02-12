variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  description = "Ubuntu AMI"
}

variable "key_name" {
  description = "EC2 key pair name"
}

variable "my_ip" {
  description = "Your public IP for SSH"
}
