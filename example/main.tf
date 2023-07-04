provider "google" {
  project = var.project_id
}

data "google_client_openid_userinfo" "userinfo" {}

data "google_project" "current" {}

resource "random_pet" "bucket" {}

resource "google_storage_bucket" "example" {
  name = "example-${random_pet.bucket.id}"

  force_destroy               = true
  location                    = "US"
  uniform_bucket_level_access = true
}

output "project" {
  value = data.google_project.current
}

output "userinfo" {
  value = data.google_client_openid_userinfo.userinfo
}

output "bucket" {
  value = google_storage_bucket.example
}
