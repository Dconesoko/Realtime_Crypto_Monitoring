provider "google" {
  credentials = file(var.credentials)
  project     = "silver-rain-325220"
  region      = "us-central1"
}

resource "google_container_cluster" "primary" {
  name     = "realtime-crypto"
  location = "us-central1-a"

  initial_node_count = 3

  node_config {
    preemptible  = true
    disk_size_gb = 100

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1-a"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    disk_size_gb = 100
    machine_type = "e2-medium"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }
}

