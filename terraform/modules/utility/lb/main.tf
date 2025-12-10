resource "proxmox_vm_qemu" "lb" {
  count       = var.instance_count
  name        = "${var.name}-${count.index + 1}"
  vmid        = var.starting_vmid + count.index
  target_node = var.node
  cores       = var.cores
  memory      = var.memory

  disk {
    size = var.disk_size
  }

  network {
    model  = "virtio"
    bridge = var.bridge
  }

  # Optional: cloud-init for IP config if needed
  # ipconfig0 = "ip=${var.vip}/24,gw=10.80.0.1"
}
