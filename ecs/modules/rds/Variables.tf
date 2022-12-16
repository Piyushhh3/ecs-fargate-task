variable "dbname-identifier" {
  default     = "wd-databaseew"
}

variable "usern" {
  default     = "admin"
}

variable "passwd" {
  default     = "admin123"
}

variable "dbname" {
  default = "wddatabasa"
}
variable "dninstance" {
  default = "db.t2.micro"
}
variable "subnet_ids" {
  type        = list
  description = "Subnet ids"
}

variable "vpc_id" {
  description = "The VPC id"
}