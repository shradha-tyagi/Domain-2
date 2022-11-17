resource "google_compute_network_peering" "data-fusion-peering" {
  name                 = "terraform-${var.env}-data-fusion-peering"
  network              = "projects/${var.project}/global/networks/default"
  peer_network         = "projects/${var.tenant_project_id}/global/networks/${var.instance_region}-${var.instance_name}"
  export_custom_routes = true
  import_custom_routes = true
}