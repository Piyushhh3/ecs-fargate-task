# ecs.tf

resource "aws_ecs_cluster" "main" {
  name = "TF-task-cluster"
}


resource "aws_ecs_task_definition" "app" {
  family                   = "TF-task_def"
  execution_role_arn       = var.role
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = file("${path.module}/task-definition/task_defi.json")

  volume {
    name = "efs-wp"
    efs_volume_configuration {
      file_system_id = aws_efs_file_system.efs.id
      root_directory = "/"
    }
  }

}

resource "aws_ecs_service" "main" {
  name            = "TF-task-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.tsk_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = var.private_subnet
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_alb_target_group.app.id
    container_name   = "nginx"
    container_port   = var.port
  }

}