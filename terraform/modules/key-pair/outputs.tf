############################################################
# Project Crystal
# Key Pair Module
############################################################

output "key_name" {

  description = "Key Pair Name"

  value = aws_key_pair.this.key_name

}

output "key_pair_id" {

  description = "Key Pair ID"

  value = aws_key_pair.this.key_pair_id

}

output "fingerprint" {

  description = "Key Fingerprint"

  value = aws_key_pair.this.fingerprint

}

output "private_key_file" {

  description = "Private Key Location"

  value = local_file.private_key.filename

}