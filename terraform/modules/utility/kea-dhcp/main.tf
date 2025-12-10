resource "local_file" "tsig_key" {
  content  = templatefile("${path.module}/templates/ddns.key.tmpl", { key_name = var.tsig_key_name })
  filename = "${path.module}/ddns.key"
}

resource "local_file" "kea_dhcp_config" {
  content  = templatefile("${path.module}/templates/kea-dhcp4.conf.tmpl", {
    subnet        = var.subnet
    pool_start    = var.pool_start
    pool_end      = var.pool_end
    router        = var.router
    dns_servers   = jsonencode(var.dns_servers)
    tsig_key_name = var.tsig_key_name
    tsig_secret   = var.tsig_secret
  })
  filename = "${path.module}/kea-dhcp4.conf"
}

resource "local_file" "kea_ddns_config" {
  content  = templatefile("${path.module}/templates/kea-dhcp-ddns.conf.tmpl", {
    tsig_key_name = var.tsig_key_name
    tsig_secret   = var.tsig_secret
    dns_server_ip = var.dns_server_ip
    domain       = var.domain
  })
  filename = "${path.module}/kea-dhcp-ddns.conf"
}
