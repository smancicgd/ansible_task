variable "health_check_name" {
  type        = string
  description = "Name for the health check"
}

variable "health_check_port" {
  type        = number
  description = "Port for the health check"
}

variable "health_check_path" {
  type        = string
  description = "Path for the health check"
}

