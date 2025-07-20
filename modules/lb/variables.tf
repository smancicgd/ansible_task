variable "health_check" {
  type        = string
  description = "Self link to health check"
}

variable "mig_instance_group" {
  type        = string
  description = "Managed instance group for backend"
}

variable "backend_name" {
  type        = string
  description = "Name for the load balancer backend"
}

variable "lb_ip_name" {
  type        = string
  description = "Load balancer public IP name"
}

variable "url_map_name" {
  type        = string
  description = "Name for the load balancer url map"
}

variable "target_http_proxy_name" {
  type        = string
  description = "Name for the load balancer http proxy"
}

variable "http_forwarding_rule_name" {
  type        = string
  description = "Name for the load balancer http forwarding rule"
}