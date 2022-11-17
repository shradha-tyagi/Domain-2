terraform {
  required_providers {
    cdap = {
      source = "GoogleCloudPlatform/cdap"
      # Pin to a specific version as 0.x releases are not guaranteed to be backwards compatible.
      version = "0.9.0"
    }
  }
}
data "google_client_config" "current" {}


provider "cdap" {
  host  = "${google_data_fusion_instance.instance.service_endpoint}/api/"
  token = "${data.google_client_config.current.access_token}"
}
data "google_compute_default_service_account" "default" {
}

resource "google_data_fusion_instance" "instance" {
  name = "terraform-${var.env}"
  description = "My Data Fusion instance"
  region = "us-west1"
  type = "BASIC"
  enable_stackdriver_logging = true
  enable_stackdriver_monitoring = true
  labels = {
    example_key = "example_value"
  }
  private_instance = true
  network_config {
    network = "default"
    ip_allocation = "10.89.48.0/22"
  }
  version = "6.7.2"
  dataproc_service_account = data.google_compute_default_service_account.default.email
  # Mark for testing to avoid service networking connection usage that is not cleaned up
}



