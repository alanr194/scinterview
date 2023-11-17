resource "google_artifact_registry_repository" "registry" {
  location      = "us-east1"
  repository_id = "scinterview"
  format        = "DOCKER"
}