variable "netbox_url" {
  description = "URL of the NetBox instance"
  type        = string
}

variable "netbox_token" {
  description = "API token for NetBox"
  type        = string
  sensitive   = true
}

variable "site" {
  description = "NetBox site slug"
  type        = string
}

variable "role" {
  description = "Device role (e.g., vm, db, web)"
  type        = string
}

variable "tenant" {
  description = "Tenant for the device"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "Subnet prefix to allocate IPs from (e.g., 10.80.0.0/24)"
  type        = string
}

variable "hostname" {
  description = "Desired hostname (optional, auto-generated if empty)"
  type        = string
  default     = ""
}
