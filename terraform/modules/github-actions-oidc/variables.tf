variable "github_repository" {
  description = "GitHub repository in owner/repo format"
  type        = string
}

variable "allowed_branches" {
  description = "Git references allowed to assume this role"
  type        = list(string)
}

variable "role_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
