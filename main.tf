# Instance template for managed instance groups - SINGLE NETWORK
resource "google_compute_address" "public_address" {
  count = "${var.public_ip}"
  name  = "${var.service}address"
}

resource "google_compute_instance_template" "instance_template-public" {
  count = "${var.public_ip}"

  lifecycle {
    create_before_destroy = true
  }

  name_prefix    = "${var.service}-${var.disk_image}-"
  can_ip_forward = "${var.ip_forward}"
  machine_type   = "${var.machine_type}"
  region         = "${var.gcp_region}"

  tags = [
    "${var.envname}",
    "${var.service}",
    "${var.needs_nat}",
    "${var.fw_tags}",
  ]

  disk {
    device_name  = "${var.disk_device_name}"
    source_image = "${var.disk_image}"
    boot         = true
  }

  disk {
    source = "${var.persistent_disk}"
    auto_delete = false
    device_name = "${var.persistent_disk_name}"
  }

  network_interface {
    network = "${var.net_name}"
    access_config {
      nat_ip = "${google_compute_address.public_address.address}"
    }
  }

  metadata {
    envname            = "${var.envname}"
    profile            = "${var.service}"
    domain             = "${var.domain}"
    startup-script-url = "${var.startup_script}"
  }

  service_account {
    scopes = ["${var.scopes}"]
  }
}

# Instance template for managed instance groups - SUBNETS ENABLED
resource "google_compute_instance_template" "instance_template-private" {
  count = "${var.private_ip}"

  lifecycle {
    create_before_destroy = true
  }

  name_prefix    = "${var.service}-${var.disk_image}-"
  can_ip_forward = "${var.ip_forward}"
  machine_type   = "${var.machine_type}"
  region         = "${var.gcp_region}"

  tags = [
    "${var.envname}",
    "${var.service}",
    "${var.needs_nat}",
    "${var.fw_tags}",
  ]

  disk {
    device_name  = "${var.disk_device_name}"
    source_image = "${var.disk_image}"
    boot         = true
  }

  disk {
    source = "${var.persistent_disk}"
    auto_delete = false
    device_name = "${var.persistent_disk_name}"
  }

  network_interface {
    subnetwork = "${var.net_name}"
  }

  metadata {
    envname            = "${var.envname}"
    profile            = "${var.service}"
    domain             = "${var.domain}"
    startup-script-url = "${var.startup_script}"
  }

  service_account {
    scopes = ["${var.scopes}"]
  }
}
