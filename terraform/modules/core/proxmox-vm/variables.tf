variable "disks" {
  type = list(object({
    slot    = string
    size    = number
    storage = string
    format  = string
    cache   = optional(string)
    ssd     = optional(bool)
    discard = optional(string)
    iothread = optional(bool)
  }))
}

variable "ci_user"          { type = string }
variable "ci_password"      { type = string, default = null }
variable "ci_ssh_key"       { type = string, default = null }
variable "ci_ipv4_cidr"     { type = string }
variable "ci_ipv4_gateway"  { type = string }
variable "ci_dns_server"    { type = string, default = null }
variable "ci_dns_domain"    { type = string, default = null }

variable "ci_datastore_id"  { type = string }
variable "ci_meta_data"     { type = string, default = null }
variable "ci_network_data"  { type = string, default = null }
variable "ci_user_data"     { type = string, default = null }
variable "ci_vendor_data"   { type = string, default = null }
