resource "google_container_cluster" "cluster" {
  name                = "scinterview-cluster"
  location            = "us-east1"
  enable_autopilot    = true
  deletion_protection = false
  network             = google_compute_network.vpc.id
  subnetwork          = google_compute_subnetwork.subnet.id
}