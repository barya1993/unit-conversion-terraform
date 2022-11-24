resource "google_cloudbuild_trigger" "unit-conversion-frontend-trigger" {
  name = "unit-conversion-frontend"

  trigger_template {
    branch_name = "^master$"
    project_id  = "secure-proxy-367022"
  }

  source_to_build {
    uri       = "https://github.com/barya1993/unit-conversion-frontend"
    ref       = "refs/heads/master"
    repo_type = "GITHUB"
  }

  filename = "cloudbuild.yaml"
}
