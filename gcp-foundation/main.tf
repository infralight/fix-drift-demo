terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.44.0"
    }
  }
  backend "gcs" {
    bucket  = "firefly-foundation"
    prefix  = "dev"
  }
}

provider "time" {
}

provider "google" {
}

provider "random" {
}

module "0-bootstrap" {
  source = "github.com/terraform-google-modules/terraform-example-foundation//0-bootstrap"

  billing_account       = "Firefly - comm-it.cloud - 1"
  org_id                = "\t1002169620247"
  groups                = {
      create_required_groups = true
      billing_project        = "your-billing-project-id"
      required_groups = {
        group_org_admins        = "gcp-org-admins@yourdomain.com"
        group_billing_admins    = "gcp-billing-admins@yourdomain.com"
        group_org_policy_admins = "gcp-policy-admins@yourdomain.com"
        group_project_creators  = "gcp-project-creators@yourdomain.com"
        group_folder_creators   = "gcp-folder-creators@yourdomain.com"
        billing_data_users      = "gcp-billing-data-users@yourdomain.com"
        audit_data_users        = "gcp-audit-data-users@yourdomain.com"
  }
  optional_groups = {
    gcp_scc_admin = "gcp-scc-admins@yourdomain.com"
  }
  }
  org_policy_admin_role = true
}
