resource "aws_cloudwatch_log_group" "strapi" {
  name              = "/ecs/strapi-libin"
  retention_in_days = 7
}
