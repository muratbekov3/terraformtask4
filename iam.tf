resource "google_service_account" "storage_sa" {
  account_id   = var.account_id
  display_name = "Storage Service Account"
}

resource "google_project_iam_member" "storage_creator" {
  project = var.project_id
  role    = "roles/storage.objectCreator"
  member  = "serviceAccount:${google_service_account.storage_sa.email}"
}