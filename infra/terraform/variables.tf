variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
  
}

variable "project_name" {
  default = "chatbot-poc"
  description = "value of the project name"
}

variable "allowed_ips" {
  description = "List of allowed CIDR blocks for inbound traffic"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI for EC2 (Amazon Linux 2023)"
  default     = "ami-02b3c03c6fadb6e2c"
}

variable "key_name" {
  description = "SSH key pair name"
  default     =  "chatbot_key_pem"
}

variable "db_user" {
  description = "Database name for RDS"
  default     = "chatbot_user"
}

variable "db_pass" {  
  description = "Password for the RDS database user"
  default     = "chatbot_pass"
}