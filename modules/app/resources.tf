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

resource "google_storage_bucket" "bucket1" {
  default_event_based_hold    = false
  enable_object_retention     = false
  force_destroy               = false
  labels                      = {}
  location                    = "US"
  name                        = "staging.cpt-poc-1.appspot.com"
  project                     = null
  public_access_prevention    = "inherited"
  requester_pays              = false
  rpo                         = "DEFAULT"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = false
  hierarchical_namespace {
    enabled = false
  }
  lifecycle_rule {
    action {
      storage_class = null
      type          = "Delete"
    }
    condition {
      age                                     = 15
      created_before                          = null
      custom_time_before                      = null
      days_since_custom_time                  = 0
      days_since_noncurrent_time              = 0
      matches_prefix                          = []
      matches_storage_class                   = []
      matches_suffix                          = []
      noncurrent_time_before                  = null
      num_newer_versions                      = 0
      send_age_if_zero                        = false
      send_days_since_custom_time_if_zero     = false
      send_days_since_noncurrent_time_if_zero = false
      send_num_newer_versions_if_zero         = false
      with_state                              = "ANY"
    }
  }
  soft_delete_policy {
    retention_duration_seconds = 604800
  }
}

resource "google_storage_bucket" "bucket2" {
  default_event_based_hold    = false
  enable_object_retention     = false
  force_destroy               = false
  labels                      = {}
  location                    = "US"
  name                        = "cpt-poc-1.appspot.com"
  project                     = null
  public_access_prevention    = "inherited"
  requester_pays              = false
  rpo                         = "DEFAULT"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = false
  hierarchical_namespace {
    enabled = false
  }
  soft_delete_policy {
    retention_duration_seconds = 604800
  }
}