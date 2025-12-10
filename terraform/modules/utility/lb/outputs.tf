output "lb_vm_names" {
  description = "List of LB VM names"
  value       = [for vm in proxmox_vm_qemu.lb : vm.name]
}

output "lb_vm_ids" {
  description = "List of LB VMIDs"
  value       = [for vm in proxmox_vm_qemu.lb : vm.vmid]
}

output "vip" {
  description = "Virtual IP assigned for the LB"
  value       = var.vip
}
