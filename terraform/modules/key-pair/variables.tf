############################################################
# Project Crystal
# Key Pair Module
############################################################

variable "key_name" {

  description = "EC2 Key Pair Name"

  type = string

}

variable "algorithm" {

  description = "Private Key Algorithm"

  type    = string
  default = "RSA"

}

variable "rsa_bits" {

  description = "RSA Key Size"

  type    = number
  default = 4096

}

variable "private_key_path" {

  description = "Local path to save the generated private key"

  type = string

}

variable "tags" {

  description = "Tags to apply to the key pair"

  type = map(string)

  default = {}

}