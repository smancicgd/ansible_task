variable "region" {
  type        = string
  default     = "us-central1"
  description = "GCP region"
}

variable "project" {
  type        = string
  description = "GCP project ID"
}

variable "zone" {
  type        = string
  default     = "us-central1-a"
  description = "GCP zone"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "vpc_name" {
  type        = string
  description = "Vpc name"
}

variable "subnet_range" {
  type        = string
  description = "Subnet CIDR range"
}

variable "allowed_ip_ranges" {
  type        = list(string)
  description = "Allowed ip ranges"
}

variable "firewall_rules" {
  description = "Map of firewall rule configurations"
  type = map(object({
    rule_name         = string
    protocol          = string
    ports             = list(string)
    allowed_ip_ranges = list(string)
    tags              = list(string)
  }))
}

variable "machine_type" {
  type        = string
  description = "Machine type for compute engine instances"
}

variable "temp_instance_name" {
  type        = string
  description = "Temporary instance name"
}

variable "custom_image_name" {
  type        = string
  description = "Custom image name"
}

variable "custom_image_descritpion" {
  type        = string
  description = "Description to add to custom image"
}

variable "temp_instance_tags" {
  type        = list(string)
  description = "Tag to add to temporary instance"
}

variable "temp_instance_label" {
  type        = string
  default = "jumpbox"
  description = "Label role for the jumpbox instance"
}

variable "mig_base_instance_name" {
  type        = string
  description = "Base instance name for all instances in managed instance group"
}

variable "mig_target_size" {
  type        = number
  description = "Target size for number of instances in managed instance group"
}

variable "mig_port_name" {
  type        = string
  description = "Managed instance group named port name"
}

variable "mig_port_number" {
  type        = number
  description = "Managed instance group named port number"
}

variable "health_check_name" {
  type        = string
  description = "Name for the healthcheck"
}

variable "health_check_port" {
  type        = number
  description = "Port for the healthcheck"
}

variable "health_check_path" {
  type        = string
  description = "Path for the healthcheck"
}

variable "mig_instance_template_name" {
  type        = string
  description = "Name for the instance template for managed instance group"
}

variable "mig_name" {
  type        = string
  description = "Name of the managed instance group"
}

variable "mig_label" {
  type        = string
  default = "mig"
  description = "Label role for instances in the managed instance group"
}

variable "lb_backend_name" {
  type        = string
  description = "Load balancer backend name"
}

variable "lb_ip_name" {
  type        = string
  description = "Load balancer public IP name"
}

variable "lb_url_map_name" {
  type        = string
  description = "Load balancer url map name"
}

variable "lb_proxy_name" {
  type        = string
  description = "Load balancer forwarding proxy name"
}

variable "lb_forwarding_rule_name" {
  type        = string
  description = "Load balancer forwarding rule name"
}


