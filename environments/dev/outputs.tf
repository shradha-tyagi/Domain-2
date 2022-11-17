
output "instance_name" {
  value = "${module.datafusion.instance_name}"
}



output "tenant_datafusion_instance" {
    value = "${module.datafusion.tenant_datafusion_instance}"
}

output "instance_region" {
    value = "${module.datafusion.instance_region}"
}