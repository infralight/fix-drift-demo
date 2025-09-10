terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.44.0"
    }
  }
}

provider "google" {
}

resource "google_container_cluster" "megatron-gke-cluster" {
  addons_config {
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }
    network_policy_config {
      disabled = true
    }
  }
  binary_authorization {
    enabled = false
  }
  cluster_autoscaling {
    autoscaling_profile = "BALANCED"
    enabled             = false
  }
  cluster_ipv4_cidr = "10.4.0.0/14"
  control_plane_endpoints_config {
    dns_endpoint_config {
      allow_external_traffic = false
      endpoint               = "gke-356a1636dbc34183a9246bca25a44cacbdea-854528475045.us-central1.gke.goog"
    }
    ip_endpoints_config {
      enabled = true
    }
  }
  database_encryption {
    state = "DECRYPTED"
  }
  default_snat_status {
    disabled = false
  }
  deletion_protection                      = true
  disable_l4_lb_firewall_reconciliation    = false
  enable_autopilot                         = false
  enable_cilium_clusterwide_network_policy = false
  enable_fqdn_network_policy               = false
  enable_intranode_visibility              = false
  enable_kubernetes_alpha                  = false
  enable_l4_ilb_subsetting                 = false
  enable_legacy_abac                       = false
  enable_multi_networking                  = false
  enable_shielded_nodes                    = true
  enable_tpu                               = false
  initial_node_count                       = 1
  location                                 = "us-central1"
  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }
  logging_service = "logging.googleapis.com/kubernetes"
  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
  master_authorized_networks_config {
    gcp_public_cidrs_access_enabled      = false
    private_endpoint_enforcement_enabled = false
  }
  monitoring_config {
    advanced_datapath_observability_config {
      enable_metrics = false
      enable_relay   = false
    }
    enable_components = ["SYSTEM_COMPONENTS"]
    managed_prometheus {
      enabled = true
    }
  }
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  name               = "megatron-gke-cluster"
  network            = "projects/product-372212/global/networks/default"
  network_policy {
    enabled  = false
    provider = "PROVIDER_UNSPECIFIED"
  }
  networking_mode = "ROUTES"
  node_config {
    disk_size_gb                = 100
    disk_type                   = "pd-balanced"
    enable_confidential_storage = false
    flex_start                  = false
    image_type                  = "COS_CONTAINERD"
    logging_variant             = "DEFAULT"
    machine_type                = "n1-standard-1"
    metadata = {
      disable-legacy-endpoints = "true"
    }
    oauth_scopes    = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
    preemptible     = false
    service_account = "default"
    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = false
    }
    spot = false
  }
  node_locations = ["us-central1-a", "us-central1-b", "us-central1-f"]
  node_pool {
    initial_node_count = 1
    management {
      auto_repair  = true
      auto_upgrade = true
    }
    name = "default-pool"
    network_config {
      create_pod_range     = false
      enable_private_nodes = false
    }
    node_config {
      disk_size_gb                = 100
      disk_type                   = "pd-balanced"
      enable_confidential_storage = false
      flex_start                  = false
      image_type                  = "COS_CONTAINERD"
      logging_variant             = "DEFAULT"
      machine_type                = "n1-standard-1"
      metadata = {
        disable-legacy-endpoints = "true"
      }
      oauth_scopes    = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
      preemptible     = false
      service_account = "default"
      shielded_instance_config {
        enable_integrity_monitoring = true
        enable_secure_boot          = false
      }
      spot = false
    }
    node_count     = 1
    node_locations = ["us-central1-a", "us-central1-b", "us-central1-f"]
    upgrade_settings {
      max_surge = 1
      strategy  = "SURGE"
    }
    version = "1.32.7-gke.1016000"
  }
  node_pool_defaults {
    node_config_defaults {
      insecure_kubelet_readonly_port_enabled = "FALSE"
      logging_variant                        = "DEFAULT"
    }
  }
  node_version = "1.32.7-gke.1016000"
  notification_config {
    pubsub {
      enabled = false
    }
  }
  pod_autoscaling {
    hpa_profile = "HPA_PROFILE_UNSPECIFIED"
  }
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = false
    master_global_access_config {
      enabled = false
    }
  }
  project = "product-372212"
  release_channel {
    channel = "REGULAR"
  }
  secret_manager_config {
    enabled = false
  }
  security_posture_config {
    mode               = "BASIC"
    vulnerability_mode = "VULNERABILITY_MODE_UNSPECIFIED"
  }
  service_external_ips_config {
    enabled = false
  }
  subnetwork         = "projects/product-372212/regions/us-central1/subnetworks/default"
  min_master_version = "1.32.7-gke.1016000"
}

