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
  project = "dev-landing-page-470309"
}

provider "random" {
}

module "bootstrap" {
  source = "github.com/terraform-google-modules/terraform-example-foundation//0-bootstrap"
  billing_account       = "Firefly - comm-it.cloud - 1"
  org_id                = "1002169620247"
  groups                = {
      create_required_groups    = true
      billing_project           = "dev-landing-page-470309"
      required_groups = {
        group_org_admins        = "gcp-org-admins@firefly.ai"
        group_billing_admins    = "gcp-billing-admins@firefly.ai"
        group_org_policy_admins = "gcp-policy-admins@firefly.ai"
        group_project_creators  = "gcp-project-creators@firefly.ai"
        group_folder_creators   = "gcp-folder-creators@firefly.ai"
        billing_data_users      = "gcp-billing-data-users@firefly.ai"
        audit_data_users        = "gcp-audit-data-users@firefly.ai"
  }
  optional_groups = {
    gcp_scc_admin = "gcp-scc-admins@firefly.ai"
  }
  }
  org_policy_admin_role = true
}
