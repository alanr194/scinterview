provider "google" {
  project = "scinterview"
  region  = "us-east1"
}

terraform {
  backend "gcs" {
    bucket = "scinterview-terraform-state"
    prefix = "terraform/state"
  }
}
