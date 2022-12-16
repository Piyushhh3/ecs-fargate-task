# var.tf
variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "3"
}

variable "cidr" {
  description = "CIDR for vpc"
  default     = "172.21.0.0/16"
}
