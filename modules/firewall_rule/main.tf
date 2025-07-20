resource "google_compute_firewall" "this" {
  name    = var.rule_name
  network = var.network

  allow {
    protocol = var.protocol
    ports    = var.ports
  }

  source_ranges = var.allowed_ip_ranges

  target_tags = var.tags
}