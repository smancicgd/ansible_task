variable "region" {
  type        = string
  description = "Region where the subnet will be created"
}

variable "zone" {
  type        = string
  description = "GCP zone"
}

variable "subnet" {
  type        = string
  description = "Self link of the subnet"
}

variable "vpc" {
  type        = string
  description = "Self link of the VPC"
}

variable "instance_template_name" {
  type        = string
  description = "Name for instance template"
}

variable "machine_type" {
  type        = string
  description = "Machine type for instance template"
}

variable "source_image" {
  type        = string
  default     = "debian-cloud/debian-11"
  description = "Source image for the temp VM"
}

variable "instance_tags" {
  type        = list(string)
  description = "Tags to set to instances using instance template"
}

variable "instance_group_manager_name" {
  type        = string
  description = "Name for the managed instance group"
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

variable "health_check" {
  type        = string
  description = "Self link to health check"
}