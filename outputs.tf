output "link-net" {
  value = "${google_compute_instance_template.instance_template-net.self_link}"
}

output "link-subnets" {
  value = "${google_compute_instance_template.instance_template-subnets.self_link}"
}
