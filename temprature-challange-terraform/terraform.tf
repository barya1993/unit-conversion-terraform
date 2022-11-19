terraform {
  backend "gcs" {
    bucket  = "terraform-us-central1-bucket"
    prefix  = "terraform/state"
  }
}
