
data "google_client_config" "current" {}


resource "cdap_application" "pipeline" {
    name = "example_pipeline"
    spec = file("/home/shradhatyagi/Sample_SQL_Server_to_BQ-cdap-data-pipeline.json")
    }


