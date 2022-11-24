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
  region  = "global"
}

terraform {
  backend "gcs" {
    bucket = "terraform-us-central1-bucket"
    prefix = "terraform/cloudbuild/state"
  }
}
