terraform {
  required_providers {
    netbox = {
      source  = "digitalocean/netbox"
      version = ">=0.3.0"
    }
  }
}

provider "netbox" {
  url   = var.netbox_url
  token = var.netbox_token
}
