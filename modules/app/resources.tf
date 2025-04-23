resource "google_compute_firewall" "nam1" {
  description             = "Allow SSH from anywhere"
  destination_ranges      = []
  direction               = "INGRESS"
  disabled                = false
  name                    = "default-allow-ssh"
  network                 = "https://www.googleapis.com/compute/v1/projects/cpt-poc-1/global/networks/default"
  priority                = 65534
  project                 = jsonencode(380343084411)
  source_ranges           = ["0.0.0.0/0"]
  source_tags             = []
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
}