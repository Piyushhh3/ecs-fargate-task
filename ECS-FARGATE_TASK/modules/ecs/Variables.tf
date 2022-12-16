# varsEcs.tf
variable "port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 8080
}

variable "tsk_count" {
  description = "Number of docker containers to run"
  default     = 1
}
variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "256"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "512"
}

variable "role" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "arn:aws:iam::826971144375:role/ecsTaskExecutionRole"
}
variable "vpc_id" {
}
variable "public_subnet" {
  type = list
  default = []
}
variable "private_subnet" {
  type = list
  default = []
}
variable "health_check_path" {
  default = "/"
}
variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "myEcsTaskExecutionRole"
}