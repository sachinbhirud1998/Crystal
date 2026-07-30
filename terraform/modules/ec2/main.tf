############################################################
# Project Crystal
# EC2 Module
############################################################

resource "aws_instance" "this" {

  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip_address

  key_name = var.key_name

  iam_instance_profile = var.iam_instance_profile

  monitoring = var.enable_detailed_monitoring

  user_data = var.user_data

  metadata_options {

    http_endpoint = var.http_endpoint
    http_tokens   = var.http_tokens

  }

  root_block_device {

    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    encrypted             = var.encrypted
    delete_on_termination = var.delete_on_termination

  }

  tags = merge(

    var.tags,

    {
      Name = var.instance_name
    }

  )

}