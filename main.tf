# Instance template for managed instance groups

resource "google_compute_instance_template" "instance_template" {

  lifecycle {
    create_before_destroy = true
  }

  name           = "${var.service}-${var.shortzone}-${var.disk_image}"
  can_ip_forward = "${var.ip_forward}"
  machine_type   = "${var.machine_type}"
  tags           = ["${var.envname}","${var.service}","nat","${split(",", var.fw_tags)}"]

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
  }

  metadata {
    envname            = "${var.envname}"
    profile            = "${var.service}"
    domain             = "${var.domain}"
    startup-script-url = "${var.startup_script}"
  }

  service_account {
    scopes = ["${split(",", var.scopes)}"]
  }
}
