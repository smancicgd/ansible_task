variable "rule_name" {
  type        = string
  description = "Name for firewall rule"
}

variable "network" {
  type        = string
  description = "Network rule is being applied to"
}

variable "protocol" {
  type        = string
  description = "Protocol"
}

variable "ports" {
  type        = list(string)
  description = "Ports"
}

variable "allowed_ip_ranges" {
  type        = list(string)
  description = "Allowed source ip ranges"
}

variable "tags" {
  type        = list(string)
  description = "Target tags"
}
