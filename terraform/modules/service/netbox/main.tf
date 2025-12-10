module "netbox_lb" {
  source        = "../../modules/lb"
  name          = "netbox-lb"
  instance_count = 2
  starting_vmid = 900
  node          = "dev-worker-1"
  cores         = 2
  memory        = 2048
  disk_size     = "20G"
  bridge        = "vmbr0"
  backend_hosts = module.netbox.instances_ips
  vip           = "10.80.0.10"
  health_check  = "/api/health"
}


# Fetch subnet from NetBox
data "netbox_ipam_prefix" "prefix" {
  prefix = var.prefix
}

# Request next available IP
resource "netbox_ipam_ip_address" "ip" {
  prefix_id   = data.netbox_ipam_prefix.prefix.id
  description = var.hostname != "" ? var.hostname : "vm"
  tenant_id   = var.tenant != "" ? var.tenant : null
}

# Assign MAC address
resource "netbox_virtualization_interface" "interface" {
  device_id = netbox_ipam_ip_address.ip.id
  name      = "eth0"
  mac       = upper(join(":", [for i in range(6) : format("%02X", random_integer.mac[i])]))
}

# Random MAC generation
resource "random_integer" "mac" {
  count = 6
  min   = 0
  max   = 255
}


