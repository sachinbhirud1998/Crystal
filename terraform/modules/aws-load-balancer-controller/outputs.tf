############################################################
# Project Crystal
# Module      : AWS Load Balancer Controller
############################################################

############################################################
# Helm Release
############################################################

output "release_name" {

  description = "Helm Release Name"

  value = helm_release.this.name

}

output "release_namespace" {

  description = "Helm Release Namespace"

  value = helm_release.this.namespace

}

output "chart_name" {

  description = "Helm Chart Name"

  value = helm_release.this.chart

}

output "chart_version" {

  description = "Helm Chart Version"

  value = helm_release.this.version

}

output "release_status" {

  description = "Helm Release Status"

  value = helm_release.this.status

}
