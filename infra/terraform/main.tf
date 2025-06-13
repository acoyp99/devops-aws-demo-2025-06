provider "aws" {
  region = var.aws_region
}

# VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name                 = "${var.project_name}-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets       = ["10.0.1.0/24", "10.0.2.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Project = "DevOps PoC"
  }
}

# EC2 instance
resource "aws_instance" "chatbot" {
  ami                         = var.ami_id
  instance_type               = "t3.medium"
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name                    = var.key_name
  security_groups = [ aws_security_group.ec2_sg.id ]

  tags = {
    Name = "${var.project_name}-ec2"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.project_name}-bucket"
  force_destroy = true
}

# RDS (PostgreSQL)
module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.12.0"

  identifier              = "chatbot-db"
  engine                  = "postgres"
  engine_version          = "14.9"
  family                  = "postgres14"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  db_name                 = "chatbot"
  username                = var.db_user
  password                = var.db_pass
  publicly_accessible     = true
  skip_final_snapshot     = true
  db_subnet_group_name    = module.vpc.database_subnet_group
  vpc_security_group_ids  = [module.vpc.default_security_group_id, aws_security_group.rds_sg.id]
  subnet_ids              = module.vpc.public_subnets
}

# Route53
resource "aws_route53_zone" "main" {
  name = "${var.project_name}-fcoyp"
}