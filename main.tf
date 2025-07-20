terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.43.0"
    }
  }
}

provider "google" {
  region  = var.region
  project = var.project
}

module "network" {
  source            = "./modules/network"
  region            = var.region
  subnet_name       = var.subnet_name
  vpc_name          = var.vpc_name
  cidr_range        = var.subnet_range
  allowed_ip_ranges = var.allowed_ip_ranges
}

module "firewall_rule" {
  source   = "./modules/firewall_rule"
  for_each = var.firewall_rules

  rule_name         = each.value.rule_name
  protocol          = each.value.protocol
  ports             = each.value.ports
  tags              = each.value.tags
  allowed_ip_ranges = each.value.allowed_ip_ranges
  network           = module.network.vpc_self_link

}

module "compute" {
  source             = "./modules/compute"
  region             = var.region
  vpc                = module.network.vpc_self_link
  subnet             = module.network.subnet_self_link
  temp_instance_name = var.temp_instance_name
  temp_instance_tags = var.temp_instance_tags
}

module "healthcheck" {
  source            = "./modules/healthcheck"
  health_check_name = var.health_check_name
  health_check_port = var.health_check_port
  health_check_path = var.health_check_path
}

module "managed_instance_group" {
  source                      = "./modules/managed_instance_group"
  vpc                         = module.network.vpc_self_link
  subnet                      = module.network.subnet_self_link
  region                      = var.region
  instance_template_name      = var.mig_instance_template_name
  machine_type                = var.machine_type
  instance_group_manager_name = var.mig_name
  zone                        = var.zone
  health_check                = module.healthcheck.healthcheck_self_link
  instance_tags               = var.temp_instance_tags
  mig_base_instance_name      = var.mig_base_instance_name
  mig_target_size             = var.mig_target_size
  mig_port_name               = var.mig_port_name
  mig_port_number             = var.mig_port_number
}

module "load_balancer" {
  source                    = "./modules/lb"
  health_check              = module.healthcheck.healthcheck_self_link
  mig_instance_group        = module.managed_instance_group.managed_instance_group
  backend_name              = var.lb_backend_name
  lb_ip_name                = var.lb_ip_name
  url_map_name              = var.lb_url_map_name
  target_http_proxy_name    = var.lb_proxy_name
  http_forwarding_rule_name = var.lb_forwarding_rule_name
}









