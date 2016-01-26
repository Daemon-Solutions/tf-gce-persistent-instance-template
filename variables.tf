# Instance template variables
variable "envname" { }
variable "service" { }
variable "domain" { }
variable "fw_tags" { }
variable "machine_type" { default = "g1-small" }
variable "disk_device_name" { default = "sda" }
variable "disk_image" { }
variable "net_name" { }
variable "scopes" { default = "storage-ro,compute-ro" }
variable "persistent_disk" { }
variable "persistent_disk_name" { default = "sdc" }
variable "startup_script" { }
variable "shortzone" { }

# Needed for NAT
variable "ip_forward" { default = "true" }
