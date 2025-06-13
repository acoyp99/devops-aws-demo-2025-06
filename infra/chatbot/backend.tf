terraform {
  backend "s3" {
    bucket         = "devops-tf-state-bucket"
    key            = "chatbot-poc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}