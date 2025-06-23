resource "google_compute_firewall" "nam1" {
  description             = "Allow SSH from anywhere"
  destination_ranges      = []
  direction               = "INGRESS"
  disabled                = false
  name                    = "default-allow-ssh"
  network                 = "https://www.googleapis.com/compute/v1/projects/cpt-poc-1/global/networks/default"
  priority                = 65534
  project                 = jsonencode(380343084411)
  source_ranges = [
    "10.0.0.0/8",       # 10.0.0.0 — 10.255.255.255
    "172.16.0.0/12",    # 172.16.0.0 — 172.31.255.255
    "192.168.0.0/16"     # 192.168.0.0 — 192.168.255.255
]
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

resource "google_compute_instance" "instance1" {
  allow_stopping_for_update  = null
  can_ip_forward             = false
  deletion_protection        = false
  description                = null
  desired_status             = null
  enable_display             = false
  hostname                   = null
  key_revocation_action_type = "NONE"
  labels                     = {}
  machine_type               = "e2-medium"
  metadata = {
    enable-oslogin = "true"
  }
  metadata_startup_script = null
  min_cpu_platform        = null
  name                    = "instance-20241010-091200"
  project                 = "cpt-poc-1"
  resource_policies       = []
  tags                    = []
  zone                    = "us-central1-c"
  boot_disk {
    auto_delete                     = true
    device_name                     = "instance-20241010-091200"
    disk_encryption_key_raw         = null # sensitive
    disk_encryption_key_rsa         = null # sensitive
    disk_encryption_service_account = null
    guest_os_features               = ["UEFI_COMPATIBLE", "VIRTIO_SCSI_MULTIQUEUE", "GVNIC", "SEV_CAPABLE", "SEV_LIVE_MIGRATABLE_V2"]
    interface                       = null
    kms_key_self_link               = null
    mode                            = "READ_WRITE"
    source                          = "https://www.googleapis.com/compute/v1/projects/cpt-poc-1/zones/us-central1-c/disks/instance-20241010-091200"
    initialize_params {
      architecture                = "X86_64"
      enable_confidential_compute = false
      image                       = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-12-bookworm-v20241009"
      labels                      = {}
      provisioned_iops            = 0
      provisioned_throughput      = 0
      resource_manager_tags       = {}
      resource_policies           = []
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
    network_ip                  = "10.128.0.7"
    nic_type                    = null
    queue_count                 = 0
    stack_type                  = "IPV4_ONLY"
    subnetwork                  = "https://www.googleapis.com/compute/v1/projects/cpt-poc-1/regions/us-central1/subnetworks/default"
    subnetwork_project          = "cpt-poc-1"
    access_config {
      nat_ip                 = "35.193.244.127"
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
  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }
}

resource "google_compute_instance" "instance2" {
  allow_stopping_for_update  = null
  can_ip_forward             = false
  deletion_protection        = false
  description                = null
  desired_status             = null
  enable_display             = false
  hostname                   = null
  key_revocation_action_type = null
  labels                     = {}
  machine_type               = "e2-medium"
  metadata                   = {}
  metadata_startup_script    = null
  min_cpu_platform           = null
  name                       = "non-compliant-vm-5b487f89"
  project                    = "cpt-poc-1"
  resource_policies          = []
  tags                       = []
  zone                       = "us-central1-a"
  boot_disk {
    auto_delete                     = true
    device_name                     = "persistent-disk-0"
    disk_encryption_key_raw         = null # sensitive
    disk_encryption_key_rsa         = null # sensitive
    disk_encryption_service_account = null
    guest_os_features               = ["UEFI_COMPATIBLE", "VIRTIO_SCSI_MULTIQUEUE", "GVNIC"]
    interface                       = null
    kms_key_self_link               = null
    mode                            = "READ_WRITE"
    source                          = "https://www.googleapis.com/compute/v1/projects/cpt-poc-1/zones/us-central1-a/disks/non-compliant-vm-5b487f89"
    initialize_params {
      architecture                = "X86_64"
      enable_confidential_compute = false
      image                       = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-11-bullseye-v20250415"
      labels                      = {}
      provisioned_iops            = 0
      provisioned_throughput      = 0
      resource_manager_tags       = {}
      resource_policies           = []
      size                        = 10
      snapshot                    = null
      storage_pool                = null
      type                        = "pd-standard"
    }
  }
  network_interface {
    internal_ipv6_prefix_length = 0
    ipv6_address                = null
    network                     = "https://www.googleapis.com/compute/v1/projects/cpt-poc-1/global/networks/test-vpc-network"
    network_attachment          = null
    network_ip                  = "10.0.0.2"
    nic_type                    = null
    queue_count                 = 0
    stack_type                  = "IPV4_ONLY"
    subnetwork                  = "https://www.googleapis.com/compute/v1/projects/cpt-poc-1/regions/us-central1/subnetworks/test-subnet"
    subnetwork_project          = "cpt-poc-1"
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
  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }
}