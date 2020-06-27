terraform {
  required_providers {
    google = "~> 3.27.0"
  }
}

variable "project_name" {
  type = string
}

provider "google" {
  project     = var.project_name
  region      = "us-central1"
}
