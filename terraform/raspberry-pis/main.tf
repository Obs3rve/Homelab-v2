provider "null" {
  version = "~> 3.0"
}

resource "null_resource" "raspberry_pi_setup" {
  count = length(var.raspberry_pi_ips)

  # This block will execute a command on each Raspberry Pi.
  provisioner "remote-exec" {
    inline = [
      "echo 'Setting up Raspberry Pi ${count.index + 1}'",
      "sudo apt-get update -y",
      "sudo apt-get install -y docker.io"
    ]

    connection {
      type        = "ssh"
      host        = var.raspberry_pi_ips[count.index]
      user        = var.ssh_users[count.index]
      private_key = file(var.ssh_private_key)
    }
  }
}
output "raspberry_pi_ips" {
  value = var.raspberry_pi_ips
}

output "ssh_users" {
  value = var.ssh_users
}
