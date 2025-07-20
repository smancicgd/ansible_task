output "managed_instance_group" {
  value = google_compute_instance_group_manager.mig_apache.instance_group
}