resource "aws_ecs_task_definition" "strapi" {
  family                   = "strapi-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"

execution_role_arn = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"
task_role_arn      = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"


  container_definitions = jsonencode([
    {
      name  = "strapi"
      image = var.image
      essential = true

      portMappings = [
        {
          containerPort = 1337
          hostPort      = 1337
        }
      ]
        environment = [
      { name = "HOST", value = "0.0.0.0" },
      { name = "PORT", value = "1337" },
      { name = "APP_KEYS", value = "myAppKey1,myAppKey2,myAppKey3,myAppKey4" },
      { name = "API_TOKEN_SALT", value = "randomApiSalt123" },
      { name = "ADMIN_JWT_SECRET", value = "randomAdminSecret123" },
      { name = "JWT_SECRET", value = "randomJwtSecret123" }
    ]
       logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = aws_cloudwatch_log_group.strapi.name
        awslogs-region        = "us-east-1"
        awslogs-stream-prefix = "ecs/strapi-libin"
      }
    }
    }
  ])
}

resource "aws_ecs_service" "service" {
  name            = "strapi-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.strapi.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = data.aws_subnets.default.ids
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  depends_on = [aws_ecs_task_definition.strapi]
}
