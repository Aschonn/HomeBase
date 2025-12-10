output "ip_address" {
  value = netbox_ipam_ip_address.ip.address
}

output "mac_address" {
  value = netbox_virtualization_interface.interface.mac
}

output "hostname" {
  value = var.hostname != "" ? var.hostname : "vm-" + substr(netbox_ipam_ip_address.ip.address, -3, 3)
}

output "subnet_id" {
  value = data.netbox_ipam_prefix.prefix.id
}
