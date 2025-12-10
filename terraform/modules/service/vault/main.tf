terraform {
  required_version = ">= 1.3.0"
}

resource "proxmox_vm_qemu" "vault" {
  count       = var.instance_count
  name        = "${var.name}-${count.index + 1}"
  target_node = var.node

  vmid        = var.vmid + count.index

  clone       = var.template
  full_clone  = true
  agent       = 1

  cores       = var.cores
  memory      = var.memory

  disks {
    size       = var.disk_size
    type       = "scsi"
    storage    = var.storage_pool
    storage_type = "lvm"
  }

  network {
    model  = "virtio"
    bridge = var.network_bridge
  }

  ipconfig0 = "ip=${var.ip_addresses[count.index]}/24,gw=${var.gateway}"

  ssh_user  = var.ssh_user

  ciuser     = var.ssh_user
  cipassword = var.ssh_password
  sshkeys    = file(var.ssh_public_key)

  cloudinit_cdrom_storage = var.storage_pool
  cicustom = "user=local:snippets/${var.name}-cloudinit.yaml"

  lifecycle {
    ignore_changes = [network]
  }
}

resource "proxmox_file" "cloudinit_file" {
  content  = templatefile("${path.module}/templates/cloudinit.yaml.tmpl", {
    ssh_user = var.ssh_user
    ssh_key  = file(var.ssh_public_key)
    vault_hcl = templatefile("${path.module}/templates/vault.hcl.tmpl", {
      api_addr = var.api_addr
      cluster_addr = var.cluster_addr
      raft_path = var.raft_path
      node_id = var.name
    })
    vault_service = templatefile("${path.module}/templates/vault.service.tmpl", {})
  })
  datastore_id = "local"
  node_name    = var.node
  path         = "${var.name}-cloudinit.yaml"
}
