resource "aws_key_pair" "strapi_key" {
  key_name   = "strapi-ec2"
  public_key = var.public_key
}
