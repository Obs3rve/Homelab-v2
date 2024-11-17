# main.tf

provider "null" {
  # You don't need to specify version here as it's deprecated. Remove this line:
  # version = "~> 3.1"
}

resource "null_resource" "install_docker_pi1" {
  connection {
    type        = "ssh"
    host        = var.pi1_ip
    user        = var.pi1_user
    private_key = file(var.ssh_private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y docker.io"
    ]
  }
}

resource "null_resource" "install_docker_pi2" {
  connection {
    type        = "ssh"
    host        = var.pi2_ip
    user        = var.pi2_user
    private_key = file(var.ssh_private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y docker.io"
    ]
  }
}
