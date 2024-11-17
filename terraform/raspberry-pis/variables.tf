# Variable for the Raspberry Pi IP addresses
variable "raspberry_pi_ips" {
  description = "List of Raspberry Pi IP addresses"
  type        = list(string)
}

# Variable for the SSH users
variable "ssh_users" {
  description = "List of SSH usernames for each Raspberry Pi"
  type        = list(string)
}

# Variable for the SSH private key file
variable "ssh_private_key" {
  description = "Path to the SSH private key file"
  type        = string
}
