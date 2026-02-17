variable "region" {
  default = "us-east-1"
}

variable "image" {
  description = "ECR image URI"
  type        = string
}
variable "public_key" {
  description = "SSH public key"
}

