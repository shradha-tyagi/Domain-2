
terraform {
  required_providers {
    cdap = {
      source = "GoogleCloudPlatform/cdap"
      # Pin to a specific version as 0.x releases are not guaranteed to be backwards compatible.
      version = "0.9.0"
    }
  }

  backend "gcs" {
    bucket = "styagi-test-tf"
    prefix = "module/pipeline"
  }
}
provider "cdap" {
  #host  = "${google_data_fusion_instance.instance.service_endpoint}/api/"
  host = "https://terraform-dev-styagi-test-dot-usw1.datafusion.googleusercontent.com/api"
  token = "${data.google_client_config.current.access_token}"
}