module "vault" {
  source = "../../modules/vault"

  name            = "vault"
  vmid            = 600
  instance_count  = 3

  node            = "pve1"
  template        = "ubuntu-cloudinit-template"

  cores           = 2
  memory          = 4096
  disk_size       = "40G"
  storage_pool    = "local-lvm"

  ip_addresses    = ["10.80.0.51", "10.80.0.52", "10.80.0.53"]
  gateway         = "10.80.0.1"

  ssh_user        = "ubuntu"
  ssh_password    = "password"
  ssh_public_key  = "~/.ssh/id_rsa.pub"

  api_addr        = "http://10.80.0.51:8200"
  cluster_addr    = "http://10.80.0.51:8201"
}
