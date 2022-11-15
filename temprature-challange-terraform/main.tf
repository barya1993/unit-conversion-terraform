terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.41.0"
    }
  }
}

provider "google" {
  project = "secure-proxy-367022"
  region  = "us-central1"
  zone    = "us-central1-c"
}

module "bucket" {
  source          = "terraform-google-modules/cloud-storage/google"
  project_id      = "secure-proxy-367022"
  location        = "us-central1"
  names           = ["bucket"]
  prefix          = "terraform"
  set_admin_roles = true
  bucket_admins = {
    second = "serviceAccount:cicdterraformsvc@secure-proxy-367022.iam.gserviceaccount.com"
  }
  labels = {
    tribe            = "platform"
    env              = "production"
    public           = "no"
    application_name = "terraform_state_bucket"
  }
  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]
}
