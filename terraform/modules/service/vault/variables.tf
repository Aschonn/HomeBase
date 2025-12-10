variable "name" {
  description = "Base name of Vault instance"
  type        = string
}

variable "vmid" {
  description = "Base VM ID"
  type        = number
}

variable "instance_count" {
  description = "Number of Vault VMs (1 for dev, 3+ for prod)"
  type        = number
  default     = 1
}

variable "node" {
  description = "Proxmox node name"
  type        = string
}

variable "template" {
  description = "Proxmox cloud-init template VM"
  type        = string
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory in MB"
  type        = number
  default     = 4096
}

variable "disk_size" {
  description = "Disk size"
  type        = string
  default     = "40G"
}

variable "storage_pool" {
  description = "Proxmox storage pool name"
  type        = string
}

variable "network_bridge" {
  type        = string
  default     = "vmbr0"
}

variable "ip_addresses" {
  type        = list(string)
}

variable "gateway" {
  type        = string
}

variable "ssh_user" {
  type        = string
  default     = "ubuntu"
}

variable "ssh_password" {
  type        = string
}

variable "ssh_public_key" {
  type = string
}

variable "api_addr" {
  description = "Vault API address"
  type        = string
}

variable "cluster_addr" {
  description = "Vault cluster address"
  type        = string
}

variable "raft_path" {
  description = "Raft storage path"
  type        = string
  default     = "/opt/vault/data"
}
