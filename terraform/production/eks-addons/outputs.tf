############################################################
# Project Crystal
# Production EKS Add-ons
############################################################

############################################################
# Add-on ARNs
############################################################

output "addon_arns" {

  description = "ARNs of the EKS Managed Add-ons"

  value = module.production_eks_addons.addon_arns

}

############################################################
# Add-on Names
############################################################

output "addon_names" {

  description = "Names of the EKS Managed Add-ons"

  value = module.production_eks_addons.addon_names

}

############################################################
# Add-on Versions
############################################################

output "addon_versions" {

  description = "Installed Versions of the EKS Managed Add-ons"

  value = module.production_eks_addons.addon_versions

}