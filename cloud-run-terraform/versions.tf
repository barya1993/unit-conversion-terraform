terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.53, < 5.0"
    }
  }
  required_version = ">= 0.13"
}

terraform {
  backend "gcs" {
    bucket = "terraform-us-central1-bucket"
    prefix = "terraform/cloud-run/state"
  }
}
