resource "google_compute_network" "vpc" {
  name                    = "scinterview-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "scinterview-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-east1"
  network       = google_compute_network.vpc.id
}