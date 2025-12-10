terraform {
  required_version = ">=1.5.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">=0.53.1"
    }
  }
}

provider "proxmox" {
  endpoint  = var.pve_api_url
  api_token = var.pve_token_secret
  insecure  = true
}

locals {
  postgres_nodes = {
    postgres-01 = {
      id       = 3000
      template = 9001
      ip       = "192.168.0.60"
    }
    postgres-02 = {
      id       = 3001
      template = 9001
      ip       = "192.168.0.61"
    }
    postgres-03 = {
      id       = 3002
      template = 9001
      ip       = "192.168.0.62"
    }
  }
}

module "postgres" {
  source = "../../Modules/vm-clone"

  for_each = local.postgres_nodes

  # VM Identity
  node        = "pve"
  vm_id       = each.value.id
  vm_name     = each.key
  description = "PostgreSQL Cluster Node"

  # Clone template
  template_id   = each.value.template
  template_node = "pve"

  # Cloud-init
  ci_user      = "postgres"
  ci_ssh_key   = "~/.ssh/proxmox.pub"
  ci_ipv4_cidr = "${each.value.ip}/24"
  ci_ipv4_gateway = "192.168.0.1"
  ci_dns_server   = "192.168.0.1"

  # Disks (new schema!)
  disks = [
    {
      slot    = "scsi0"
      size    = 50
      storage = "local-lvm"
      format  = "raw"
    },
    {
      slot    = "scsi1"
      size    = 4
      storage = "local-lvm"
      format  = "raw"
    }
  ]
}
