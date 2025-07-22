variable "machine_type" {
  type        = string
  default     = "e2-micro"
  description = "Machine type for the temp instance"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "source_image" {
  type        = string
  default     = "debian-cloud/debian-11"
  description = "Source image for the temp VM"
}

variable "subnet" {
  type        = string
  description = "Self link of the subnet"
}

variable "vpc" {
  type        = string
  description = "Self link of the VPC"
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "temp_instance_name" {
  type        = string
  description = "Temporary instance name"
}

variable "temp_instance_tags" {
  type        = list(string)
  description = "Tag to add to temporary instance"
}

variable "role_label" {
  type        = string
  description = "Role label value"
}