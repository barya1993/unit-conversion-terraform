##gcs bucket for saving the state files of terraform
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
  name       = "terraform-bucket"
  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]

  iam_members = [{
    role   = "roles/storage.admin"
    member = "serviceAccount:$cicdterraformsvc@secure-proxy-367022.iam.gserviceaccount.com"
  }]
}
