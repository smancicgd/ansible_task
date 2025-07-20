resource "google_compute_instance_template" "instance_template" {
  name         = var.instance_template_name
  machine_type = var.machine_type

  disk {
    boot         = true
    auto_delete  = true
    source_image = var.source_image
  }

  network_interface {
    network    = var.vpc
    subnetwork = var.subnet
  }

  metadata = {
    ssh-keys = "debian:${file("~/.ssh/id_rsa.pub")}"
  }

  metadata_startup_script = file("${path.module}/../../scripts/startup.sh")

  tags = var.instance_tags
}

resource "google_compute_instance_group_manager" "mig_apache" {
  name               = var.instance_group_manager_name
  base_instance_name = var.mig_base_instance_name
  zone               = var.zone
  version {
    instance_template = google_compute_instance_template.instance_template.self_link
  }
  target_size = var.mig_target_size

  named_port {
    name = var.mig_port_name
    port = var.mig_port_number
  }

  auto_healing_policies {
    health_check      = var.health_check
    initial_delay_sec = 30
  }
}




