resource "google_compute_backend_service" "this" {
  name                  = var.backend_name
  protocol              = "HTTP"
  port_name             = "http"
  timeout_sec           = 10
  load_balancing_scheme = "EXTERNAL"
  health_checks         = [var.health_check]

  backend {
    group = var.mig_instance_group
  }
}

resource "google_compute_url_map" "this" {
  name            = var.url_map_name
  default_service = google_compute_backend_service.this.self_link
}

resource "google_compute_target_http_proxy" "this" {
  name    = var.target_http_proxy_name
  url_map = google_compute_url_map.this.self_link
}

resource "google_compute_global_address" "lb_ip" {
  name = var.lb_ip_name
}

resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name                  = var.http_forwarding_rule_name
  target                = google_compute_target_http_proxy.this.self_link
  port_range            = "80"
  ip_address            = google_compute_global_address.lb_ip.address
  load_balancing_scheme = "EXTERNAL"
}