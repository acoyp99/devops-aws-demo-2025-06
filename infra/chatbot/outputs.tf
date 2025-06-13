output "ec2_public_ip" {
  value = aws_instance.chatbot.public_ip
}

output "rds_endpoint" {
  value = module.db.db_instance_endpoint
}

output "s3_bucket_name" {
  value = aws_s3_bucket.app_bucket.id
}

output "route53_zone_id" {
  value = aws_route53_zone.main.zone_id
}