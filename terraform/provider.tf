provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "strapi-terraform-state-libin"
    key            = "ecs/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}