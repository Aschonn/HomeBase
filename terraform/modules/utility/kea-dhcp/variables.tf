variable "subnet" { type = string }
variable "pool_start" { type = string }
variable "pool_end" { type = string }
variable "router" { type = string }
variable "dns_servers" { type = list(string) }
variable "domain" { type = string }
variable "dns_server_ip" { type = string }

variable "tsig_key_name" { type = string, default = "ddns-key" }
variable "tsig_secret" { type = string, default = "GENERATE_RANDOM_BASE64_SECRET" }
