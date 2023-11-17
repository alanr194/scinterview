provider "kubernetes" {
  config_path = "~/.kube/config"
}

terraform {
  backend "gcs" {
    bucket = "scinterview-terraform-state"
    prefix = "terraform/kubernetes/state"
  }
}
