# Instance template variables
variable "envname" {}
variable "service" {}
variable "domain" {}
variable "disk_image" {}
variable "net_name" {}
variable "persistent_disk" {}
variable "startup_script" {}
variable "shortzone" {}
variable gcp_region {}
variable needs_nat {}
variable public_ip {}
variable private_ip {}

variable "fw_tags" {
  type = "list"
}

variable "machine_type" {
  default = "g1-small"
}

variable "disk_device_name" {
  default = "sda"
}

variable "scopes" {
  default = [
    "storage-ro",
    "compute-ro",
  ]
}

variable "persistent_disk_name" {
  default = "sdc"
}

# Needed for NAT
variable "ip_forward" {
  default = "true"
}
