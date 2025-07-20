output "healthcheck_self_link" {
  value       = google_compute_health_check.this.self_link
  description = "Self link for created healthcheck"
}