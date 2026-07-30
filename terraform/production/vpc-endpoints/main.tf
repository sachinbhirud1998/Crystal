############################################################
# Project Crystal
# Production VPC Endpoints
############################################################

############################################################
# Production Networking Remote State
############################################################

data "terraform_remote_state" "networking" {

  backend = "local"

  config = {

    path = "../networking/terraform.tfstate"

  }

}

############################################################
# Local Values
############################################################

locals {

  private_subnet_ids = values(

    data.terraform_remote_state.networking.outputs.private_subnet_ids

  )

  route_table_ids = [

    data.terraform_remote_state.networking.outputs.public_route_table_id

  ]

}