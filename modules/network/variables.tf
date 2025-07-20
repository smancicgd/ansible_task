variable "vpc_name" {
  type        = string
  description = "Name of the VPC network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "cidr_range" {
  type        = string
  description = "CIDR range for the subnet"
}

variable "region" {
  type        = string
  description = "Region where the subnet will be created"
}

variable "allowed_ip_ranges" {
  type        = list(string)
  description = "List of source IP ranges allowed to access HTTP"
}