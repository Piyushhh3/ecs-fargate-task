# ecs.tf

resource "aws_ecs_cluster" "main" {
  name = "TF-task-cluster"
}


resource "aws_ecs_task_definition" "taskk" {
  family                   = "TF-task_def"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = "${file("task_defi.json")}"
}

resource "aws_ecs_service" "tassk" {
  name            = "TF-task-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.taskk.arn
  desired_count   = var.count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = aws_subnet.public.*.id
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_alb_target_group.TG.id
    container_name   = "nginx"
    container_port   = var.port

  
}
}
