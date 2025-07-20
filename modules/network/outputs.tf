output "vpc_self_link" {
  value = google_compute_network.this.self_link
}

output "subnet_self_link" {
  value = google_compute_subnetwork.subnet.self_link
}

