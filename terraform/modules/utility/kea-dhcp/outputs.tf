output "tsig_key_file" { value = "${path.module}/ddns.key" }
output "kea_dhcp_config_file" { value = "${path.module}/kea-dhcp4.conf" }
output "kea_ddns_config_file" { value = "${path.module}/kea-dhcp-ddns.conf" }
