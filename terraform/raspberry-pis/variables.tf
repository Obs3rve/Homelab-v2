# variables.tf

variable "pi1_ip" {
  description = "IP address of the master Raspberry Pi (pi1)"
  type        = string
}

variable "pi2_ip" {
  description = "IP address of the worker Raspberry Pi (pi2)"
  type        = string
}

variable "pi1_user" {
  description = "SSH user for the master Raspberry Pi (pi1)"
  type        = string
}

variable "pi2_user" {
  description = "SSH user for the worker Raspberry Pi (pi2)"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}

variable "k3s_token" {
  description = "K3s token to join the worker node to the master"
  type        = string
}
