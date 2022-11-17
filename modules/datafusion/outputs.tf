output "instance_name" {
  value = "${google_data_fusion_instance.instance.name}"
}

output "tenant_datafusion_instance" {
    value = "${google_data_fusion_instance.instance.tenant_project_id}"
}

output "instance_region" {
    value = "${google_data_fusion_instance.instance.region}"
}