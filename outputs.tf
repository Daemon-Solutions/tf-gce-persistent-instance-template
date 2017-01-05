output "link" {
  value = "${coalesce("${google_compute_instance_template.instance_template-public.self_link}","${google_compute_instance_template.instance_template-private.self_link}")}"
}

#output "link-public" {
#  value = "${google_compute_instance_template.instance_template-public.self_link}"
#}

output "external_ip" {
  #value = "${coalesce("${google_compute_instance_template.instance_template-public.network_interface.0.access_config.0.nat_ip}","0")}"
  value = "${google_compute_instance_template.instance_template-public.network_interface.0.access_config.0.nat_ip}"
}
