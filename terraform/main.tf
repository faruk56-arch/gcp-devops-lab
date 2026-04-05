provider "google" {
  project = var.project_id
  region  = var.region
}

# Artifact Registry
resource "google_artifact_registry_repository" "repo" {
  location      = var.region
  repository_id = "docker-repo"
  format        = "DOCKER"
}

# GKE Autopilot
resource "google_container_cluster" "gke" {
  name     = "gke-autopilot"
  location = var.region

  enable_autopilot = true
}