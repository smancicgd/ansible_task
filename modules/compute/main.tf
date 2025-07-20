resource "google_compute_instance" "temp_instance" {
  name         = var.temp_instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.source_image
    }
  }

  network_interface {
    network    = var.vpc
    subnetwork = var.subnet
    access_config {}
  }

  metadata = {
    ssh-keys = "debian:${file("~/.ssh/id_rsa.pub")}"
  }

  tags = var.temp_instance_tags
}