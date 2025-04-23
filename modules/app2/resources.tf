resource "google_storage_bucket" "bucket3" {
  default_event_based_hold    = false
  enable_object_retention     = false
  force_destroy               = false
  labels                      = {}
  location                    = "ASIA-SOUTH1"
  name                        = "karan-test-bucket-1"
  project                     = null
  public_access_prevention    = "enforced"
  requester_pays              = false
  rpo                         = null
  storage_class               = "STANDARD"
  uniform_bucket_level_access = false
  hierarchical_namespace {
    enabled = false
  }
  soft_delete_policy {
    retention_duration_seconds = 604800
  }
}

resource "google_compute_instance" "instance3" {
  allow_stopping_for_update  = null
  can_ip_forward             = false
  deletion_protection        = false
  description                = null
  desired_status             = null
  enable_display             = false
  hostname                   = null
  key_revocation_action_type = "NONE"
  labels                     = {}
  machine_type               = "e2-micro"
  metadata = {
    enable-osconfig = "TRUE"
    ssh-keys        = "ankurdua_insecure:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1P9pCVcp63Os1uMZG+neM+j0YbvTe6MGcxs4RCCW7pchstCOV5bw0qEChqfhdTdzLm0HWprSp4w14ug4EJvUKWmIE1MVeNLV8NOwohEbe6StykPH6HhgolqEvErdEqpTTomdHduHaIggPaPIPcNJRN+w3iqZpWjtBT2aCeShvfAjx1lj1YjVwjbWXTQ5rSrQ1V2EkAcyYDVnJeM2hqw6MbRXncW25g04iUNk5X7ZJZn0YnWl54JngOIf3m1j5VpoKLlMP8B8S91XRsZ0NnBdyAp5ItkPGAztmjK0GQonsx/+yS/sXadWJakE5h+pSMFVLa0xR+0ssIr/coXdef8I1GUNXHf34RsmA4c+OiKA20ab6/DM3nWW5n5VFBZNU1FfYqXzemd9/vsO7zVbpxupFz6g984gYeknsSD//DfaaHLPjIqDGGF5SmWj696mqYfwd2x740FEnAJT4MjfQPhjReSf58y783uP1QxguT2gdAShAYVAFK6/dCk7jbAP56mc= ankurdua_insecure\nankurdua:ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEhRCnqpJ0QKjC+hiFLOlUsIIFVVANkTPYDM6wzGWQk+l0Hf+VuSolcl1SZtaw8udFQPktPJlOXB9gS0gD7oj+Y= google-ssh {\"userName\":\"ankurdua@google.com\",\"expireOn\":\"2025-04-22T13:41:13+0000\"}\nankurdua:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCK0SgycFCknjm26vL0p+AJ1NnPcTlSKcaDb01BAuwJ+xre45BJkwNBp5cJEeHkGB0EZSjzzjkUZEjVgTcBENJBqXfXjPX8Drr25dYVn9+dgCgz8onh04b+GKU1bwXejioSxl+oIjtGfTG83LDPnvesk9WFvNgs5nf3k5r3FOlK8fO1UAUG6hjM6DEBR/B4uAvHZH7VqTmOmBuPhx6XKOoXR11yG41mKu9aLROkGfGbe3FrCPBFpbdJ5r69HbP3JhI/0zptNpWJ71HbgqGoCBP6hFZz+9p0HSexWpLyF1yRjlq1XA0Lt++tEu9E4gUoK4iW65fjwqlwx6qq8QR0qajz google-ssh {\"userName\":\"ankurdua@google.com\",\"expireOn\":\"2025-04-22T13:41:18+0000\"}"
  }
  metadata_startup_script = null
  min_cpu_platform        = null
  name                    = "ankurdua-pam-ssh"
  project                 = "cpt-poc-1"
  resource_policies       = []
  tags                    = ["http-server", "https-server"]
  zone                    = "us-central1-c"
  boot_disk {
    auto_delete                     = true
    device_name                     = "ankurdua-pam-ssh"
    disk_encryption_key_raw         = null # sensitive
    disk_encryption_key_rsa         = null # sensitive
    disk_encryption_service_account = null
    guest_os_features               = ["UEFI_COMPATIBLE", "VIRTIO_SCSI_MULTIQUEUE", "GVNIC", "SEV_CAPABLE", "SEV_LIVE_MIGRATABLE_V2"]
    interface                       = null
    kms_key_self_link               = null
    mode                            = "READ_WRITE"
    source                          = "https://www.googleapis.com/compute/v1/projects/cpt-poc-1/zones/us-central1-c/disks/ankurdua-pam-ssh"
    initialize_params {
      architecture                = "X86_64"
      enable_confidential_compute = false
      image                       = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-12-bookworm-v20250415"
      labels                      = {}
      provisioned_iops            = 0
      provisioned_throughput      = 0
      resource_manager_tags       = {}
      resource_policies           = ["https://www.googleapis.com/compute/v1/projects/cpt-poc-1/regions/us-central1/resourcePolicies/default-schedule-1"]
      size                        = 10
      snapshot                    = null
      storage_pool                = null
      type                        = "pd-balanced"
    }
  }
  confidential_instance_config {
    confidential_instance_type  = null
    enable_confidential_compute = false
  }
  network_interface {
    internal_ipv6_prefix_length = 0
    ipv6_address                = null
    network                     = "https://www.googleapis.com/compute/v1/projects/cpt-poc-1/global/networks/default"
    network_attachment          = null
    network_ip                  = "10.128.0.58"
    nic_type                    = null
    queue_count                 = 0
    stack_type                  = "IPV4_ONLY"
    subnetwork                  = "https://www.googleapis.com/compute/v1/projects/cpt-poc-1/regions/us-central1/subnetworks/default"
    subnetwork_project          = "cpt-poc-1"
    access_config {
      nat_ip                 = "34.42.250.26"
      network_tier           = "PREMIUM"
      public_ptr_domain_name = null
    }
  }
  reservation_affinity {
    type = "ANY_RESERVATION"
  }
  scheduling {
    automatic_restart           = true
    availability_domain         = 0
    instance_termination_action = null
    min_node_cpus               = 0
    on_host_maintenance         = "MIGRATE"
    preemptible                 = false
    provisioning_model          = "STANDARD"
    termination_time            = null
  }
  service_account {
    email  = "380343084411-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }
}
