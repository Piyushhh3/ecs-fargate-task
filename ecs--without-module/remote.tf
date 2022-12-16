terraform {
  backend "s3" {
    bucket = "terraform-state-task"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}