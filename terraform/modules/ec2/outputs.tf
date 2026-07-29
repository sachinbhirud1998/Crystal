############################################################
# Project Crystal
# EC2 Module
############################################################

output "instance_id" {

  description = "EC2 Instance ID"

  value = aws_instance.this.id

}

output "instance_arn" {

  description = "EC2 Instance ARN"

  value = aws_instance.this.arn

}

output "instance_private_ip" {

  description = "Private IP"

  value = aws_instance.this.private_ip

}

output "instance_public_ip" {

  description = "Public IP"

  value = aws_instance.this.public_ip

}

output "instance_private_dns" {

  description = "Private DNS"

  value = aws_instance.this.private_dns

}

output "instance_public_dns" {

  description = "Public DNS"

  value = aws_instance.this.public_dns

}

output "availability_zone" {

  description = "Availability Zone"

  value = aws_instance.this.availability_zone

}