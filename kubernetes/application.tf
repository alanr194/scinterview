resource "kubernetes_deployment_v1" "scinterview-deployment" {
  metadata {
    name = "scinterview-deployment"
    labels = {
      name = "scinterview-deployment"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = "scinterview-app"
      }
    }

    template {
      metadata {
        labels = {
          name = "scinterview-app"
        }
      }

      spec {
        container {
          image = "us-east1-docker.pkg.dev/scinterview/scinterview/app:latest"
          name  = "nginx"

          liveness_probe {
            http_get {
              path = "/"
              port = 80
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "scinterview-service" {
  metadata {
    name = "scinterview-service"
  }
  spec {
    selector = {
      name = "scinterview-app"
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}