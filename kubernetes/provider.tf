data "google_client_config" "default" {}
data "google_container_cluster" "scinterview_cluster" {
  name     = "scinterview-cluster"
  location = "us-east1-a"
}

provider "google" {
  project = "scinterview"
  region  = "us-east1"
}

provider "kubernetes" {
  host                   = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
}

terraform {
  backend "gcs" {
    bucket = "scinterview-terraform-state"
    prefix = "terraform/kubernetes/state"
  }
}
