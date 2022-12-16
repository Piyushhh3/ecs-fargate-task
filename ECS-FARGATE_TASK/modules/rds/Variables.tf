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
variable "private_subnet" {
  description = "Subnet ids"
  type = list
  default = []
}

variable "vpc_id" {
  description = "The VPC id"
}