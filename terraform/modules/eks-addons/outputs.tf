############################################################
# Project Crystal
# Reusable EKS Add-ons Module
############################################################

############################################################
# Add-on ARNs
############################################################

output "addon_arns" {

  description = "ARNs of all EKS Add-ons"

  value = {

    for addon_name, addon in aws_eks_addon.this :

    addon_name => addon.arn

  }

}

############################################################
# Add-on Names
############################################################

output "addon_names" {

  description = "Names of all EKS Add-ons"

  value = {

    for addon_name, addon in aws_eks_addon.this :

    addon_name => addon.addon_name

  }

}

############################################################
# Add-on Versions
############################################################

output "addon_versions" {

  description = "Installed Add-on Versions"

  value = {

    for addon_name, addon in aws_eks_addon.this :

    addon_name => addon.addon_version

  }

}