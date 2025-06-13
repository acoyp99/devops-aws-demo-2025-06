variable "aws_region" {
  default = "us-east-1"
}
variable "ami_id" {
  description = "AMI for EC2 (Amazon Linux 2023)"
  default     = "ami-0c101f26f147fa7fd"
}
variable "key_name" {
  description = "SSH key pair name"
}
variable "project_name" {
  default = "chatbot-poc"
}
variable "db_user" {}
variable "db_pass" {}
variable "domain_name" {
  description = "Public domain managed by Route53"
}