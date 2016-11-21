# Instance template variables
variable "envname" { }
variable "service" { }
variable "domain" { }
variable "fw_tags" { type = "list" }
variable "machine_type" { default = "g1-small" }
variable "disk_device_name" { default = "sda" }
variable "disk_image" { }
variable "net_name" { }
variable "scopes" { default = "storage-ro,compute-ro" }
variable "persistent_disk" { }
variable "persistent_disk_name" { default = "sdc" }
variable "startup_script" { }
variable "shortzone" { }

variable gcp_region {}
variable needs_nat {}
variable subnets_enabled {}
variable network_enabled {}

# Needed for NAT
variable "ip_forward" { default = "true" }
