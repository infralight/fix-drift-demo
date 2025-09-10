terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.44.0"
    }
  }
}

provider "google" {}

# --- GKE Standard cluster (no Autopilot) ---
resource "google_container_cluster" "megatron-gke-cluster" {
  name       = "megatron-gke-cluster"
  project    = "product-372212"
  location   = "us-central1"
  network    = "projects/product-372212/global/networks/default"
  subnetwork = "projects/product-372212/regions/us-central1/subnetworks/default"

  # Control plane / endpoints
  control_plane_endpoints_config {
    dns_endpoint_config {
      allow_external_traffic = false
      endpoint               = "gke-356a1636dbc34183a9246bca25a44cacbdea-854528475045.us-central1.gke.goog"
    }
    ip_endpoints_config {
      enabled = true
    }
  }

  # Logging/Monitoring
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }
  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
    managed_prometheus { enabled = true }
  }

  # Addons (keep only CSI; remove network_policy_config to avoid conflicts)
  addons_config {
    gce_persistent_disk_csi_driver_config { enabled = true }
  }

  # Remove cluster_autoscaling block (not used / was flagged)
  # Remove binary_authorization (was flagged)
  # Remove enable_intranode_visibility (was flagged)
  # Remove network_policy block (was flagged)

  # Private cluster
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_global_access_config { enabled = false }
  }

  # Misc
  deletion_protection                   = true
  disable_l4_lb_firewall_reconciliation = false
  enable_kubernetes_alpha               = false
  enable_tpu                            = false
  networking_mode                       = "ROUTES"

  # Pod autoscaling profile (fix)
  pod_autoscaling {
    hpa_profile = "NONE" # or "PERFORMANCE"
  }

  # Optional: channel / versions
  release_channel { channel = "REGULAR" }
  min_master_version = "1.32.7-gke.1016000"
}

# --- Separate node pool (Standard) ---
resource "google_container_node_pool" "default_pool" {
  project  = "product-372212"
  cluster  = google_container_cluster.megatron-gke-cluster.name
  location = google_container_cluster.megatron-gke-cluster.location

  name   = "default-pool"
  version = "1.32.7-gke.1016000"

  initial_node_count = 1
  node_count         = 1
  node_locations     = ["us-central1-a", "us-central1-b", "us-central1-f"]

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  network_config {
    create_pod_range     = false
    enable_private_nodes = false
  }

  node_config {
    machine_type = "n1-standard-1"
    image_type   = "COS_CONTAINERD"
    disk_type    = "pd-balanced"
    disk_size_gb = 100

    service_account = "default"
    preemptible     = false
    spot            = false

    metadata = { disable-legacy-endpoints = "true" }

    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = false
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }

  upgrade_settings {
    strategy  = "SURGE"
    max_surge = 1
  }
}
