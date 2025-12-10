variable "pve_token_id" {
  default = "terraform"
  sensitive = true
}
variable "pve_token_secret" {
  default = "terraform@pve!provider=0ae3cd6c-e026-4b91-afb2-8d57a415f51f"
  sensitive = true
}

variable "pve_api_url" {
  default = "https://192.168.0.100:8006/api2/json"
  type    = string
}
