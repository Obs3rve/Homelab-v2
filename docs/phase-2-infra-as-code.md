Phase 2: Infrastructure as Code
In this phase, we will implement Infrastructure as Code (IaC) using Terraform to automate the provisioning and management of our Raspberry Pi infrastructure. This approach ensures repeatability, reduces manual errors, and lays the groundwork for scalable configurations as we migrate to Azure in future phases.

This is the main reason i started this project to learn Terraform and Take the 003 certification while gaining hands on experience. 

Goals

- Install and configure Terraform on your workstation.
- Write a Terraform configuration to manage the Raspberry Pi infrastructure.
- Apply and verify the configuration to ensure it works as intended.


Step 1

The first step is to get Terraform on my Mac

I use brew so 

the follow commands were used to install Terraform

brew update

brew tap hashicorp/tap

brew install hashicorp/tap/terraform

If you dont use a Mac you can find the steps required for your OS here - https://developer.hashicorp.com/terraform/install

Once done confirm it's installed by checking the version

terraform --version


Step 2: Setting Up Your Terraform Directory for Raspberry Pi Infrastructure

Now that Terraform is installed and initialized, the next step is to organize your project directory to manage your Raspberry Pi infrastructure effectively. A well-structured directory makes your work easier to manage, reusable, and scalable.

Why Directory Structure Matters

Terraform uses configuration files (usually .tf files) to define infrastructure. Organizing these files helps:

Separate concerns (variables, resources, and outputs).
Avoid clutter as the project grows.
Prepare for adding more phases later (e.g., Azure migration).

Steps to Create the Directory
Navigate to Your Project Root Directory
Go to the root of your homelab-v2 project:
cd ~/homelab-v2
Create a Directory for Terraform Files
Organize Terraform files for the Raspberry Pi setup:
mkdir -p terraform/raspberry-pis
cd terraform/raspberry-pis
Set Up Initial Terraform Files
Create the necessary .tf files to structure your Terraform configuration:
main.tf: Contains the core resources and logic.
variables.tf: Stores all configurable inputs (e.g., Raspberry Pi IPs).
outputs.tf: Displays key information after Terraform runs (e.g., IP addresses).
touch main.tf variables.tf outputs.tf
Verify Your Directory Structure Check that everything is correctly set up by listing the contents:
tree ~/homelab-v2/terraform/
Output should look like this:

terraform/
└── raspberry-pis/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
Directory Structure Explanation
terraform/raspberry-pis: Holds all Terraform files related to Raspberry Pi infrastructure.
main.tf: The central configuration file where resources and logic are defined.
variables.tf: Keeps configurable inputs separate for easier management and reusability.
outputs.tf: Displays important information once resources are provisioned.




### **Step 3: Writing the `variables.tf` and `terraform.tfvars` Files**

In this step, we'll define the **inputs** that Terraform needs for your Raspberry Pi infrastructure (like IP addresses, SSH usernames, and keys). We'll break it down into two parts: **defining the variables** and **providing the values** for those variables.

#### **Why Do We Need Variables?**
- Variables allow you to easily **customize** your setup without modifying the main configuration files.
- They help you **manage sensitive information** (like SSH keys) in a secure manner.
- By using variables, we can keep the configuration **flexible** and **reusable** for different environments (like development, staging, or production).

---

### **Part 1: Writing the `variables.tf` File**

1. **Navigate to Your `terraform/raspberry-pis` Directory**
   Make sure you’re inside the directory where your Terraform configuration for the Raspberry Pis is located:
   ```bash
   cd ~/homelab-v2/terraform/raspberry-pis
   ```

2. **Open the `variables.tf` File for Editing**
   Create or open the `variables.tf` file:
   ```bash
   vim variables.tf
   ```

3. **Define the Variables**
   In the `variables.tf` file, you’ll define the inputs (variables) that you will later provide values for. Add the following code to declare the variables needed for your Raspberry Pi setup:

   ```hcl
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
   ```

   **Explanation**:
   - `raspberry_pi_ips`: A **list** of IP addresses for the Raspberry Pis you want to manage with Terraform. This allows you to scale up easily by adding more IPs.
   - `ssh_user`: The **SSH username** used to access your Raspberry Pis. The default is set to `"pi"`, which is the default user for Raspberry Pi OS.
   - `ssh_private_key`: The **path to your private SSH key**, which Terraform will use to securely access the Raspberry Pis.

4. **Save and Exit**
   - If you’re using `vim`, press `Esc` and type `:wq` to save and exit the editor.

---

### **Part 2: Writing the `terraform.tfvars` File**

1. **Create the `terraform.tfvars` File**
   Now, you need to create a `terraform.tfvars` file, where you’ll provide the actual values for the variables defined in `variables.tf`.

   Run this command to create and open the `terraform.tfvars` file:
   ```bash
   vim terraform.tfvars
   ```

2. **Add the Actual Values for Your Variables**
   Inside the `terraform.tfvars` file, add the values for your variables (replace the values with your actual Raspberry Pi details):

   ```hcl
  # Raspberry Pi IPs
raspberry_pi_ips = ["192.168.1.101", "192.168.1.102"]  # Replace with your Pi's IPs
   # SSH Usernames (one for each Raspberry Pi)
ssh_users = ["pi1", "pi2"]  # Replace with actual usernames for each Pi

   # Path to your private SSH key
ssh_private_key = "~/.ssh/id_rsa"  # Replace with your SSH key path

   ```

   **Explanation**:
   - `raspberry_pi_ips`: Replace the placeholder IPs (`"192.168.1.101", "192.168.1.102"`) with the actual IP addresses of your Raspberry Pis.
   - `ssh_user`: You can keep the default `"pi"`, or change it to a custom SSH user if you’re using a different username.
   - `ssh_private_key`: Provide the path to your **private SSH key** used for connecting to the Raspberry Pis. Ensure that this file exists and is accessible on your system.

3. **Save and Exit**
   - If you’re using `vim`, press `Esc` and type `:wq` to save and exit the editor.

---

### **Why This Works**
- The **`variables.tf`** file defines the structure and type of variables (what Terraform needs to know).
- The **`terraform.tfvars`** file provides the actual values for those variables (your Raspberry Pi IPs, SSH username, and SSH key).
- By keeping the variable declarations separate from the values, you can easily switch between different environments or configurations by editing the `terraform.tfvars` file without changing the core Terraform configuration.

---

Great! Let's move on to **Step 4**, where we'll write the `main.tf` file to define the actual infrastructure and configure the resources using Terraform. This will involve:

- **Accessing each Raspberry Pi** via SSH using the IPs and usernames.
- **Executing commands or configurations** (e.g., setting up packages, creating files, etc.).

---

### **Step 4: Writing the `main.tf` File**

1. **Navigate to the `terraform/raspberry-pis` Directory**
   
   Make sure you’re inside the directory where your Raspberry Pi Terraform configuration files are located:
   ```bash
   cd ~/homelab-v2/terraform/raspberry-pis
   ```

2. **Create the `main.tf` File**:

   Open the `main.tf` file in your preferred text editor:
   ```bash
   vim main.tf
   ```

3. **Define the `provider` Block**:

   The `provider` block tells Terraform how to interact with the Raspberry Pis via SSH. Since we're not using a cloud provider like AWS or Azure, we’ll use the `remote-exec` provisioner, which allows us to run commands on the Raspberry Pis over SSH.

   Add the following code to your `main.tf` file:

   ```hcl
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
   ```

   **Explanation of the Code**:

   - **Provider Block**:
     - The `null` provider is used because we are not creating actual cloud resources but just running some remote commands via SSH.
     - This tells Terraform that we want to use the `null` provider, which is useful for executing local and remote scripts, like SSH commands.
   
   - **Resource Block (`null_resource`)**:
     - This block represents a **resource** that we will configure and provision on each Raspberry Pi. The `count` argument ensures that the resource is applied to each Raspberry Pi (as specified by the number of IPs in `raspberry_pi_ips`).
     - The `remote-exec` provisioner is used to run commands on the Raspberry Pi(s) over SSH. The commands here update the Raspberry Pi and install Docker (`docker.io`).
   
   - **Connection Block**:
     - The `connection` block specifies how Terraform should connect to the Raspberry Pi. It uses the values you provided in `terraform.tfvars`:
       - `host`: The IP address of the Raspberry Pi.
       - `user`: The SSH username for the Raspberry Pi.
       - `private_key`: The private key used for SSH access.

   - The `count.index` is a special variable in Terraform that allows us to reference the current item in a list. In this case, it allows us to apply the configuration for each Raspberry Pi IP and username.

4. **Save and Exit**:

   Press `Esc` and type `:wq` to save and exit the editor.

---

### **Next Steps: Initializing Terraform and Applying the Configuration**

Once you have written the `main.tf` file, we can proceed to initialize Terraform and apply the configuration to set up the Raspberry Pis.

#### **Step 5: Initialize Terraform**
Run the following command to initialize Terraform in the current directory. This will download the necessary provider plugins and set up the environment for provisioning:

```bash
terraform init
```

#### **Step 6: Apply the Configuration**
Run the following command to apply the configuration. This will prompt Terraform to connect to your Raspberry Pis and execute the commands (e.g., updating and installing Docker):

```bash
terraform apply
```

- Terraform will show you an execution plan. It will indicate what resources will be created or modified.
- Review the plan, and type `yes` to proceed.

---

### **Next Steps After Applying**

- Terraform will connect to each Raspberry Pi and run the necessary commands defined in the `remote-exec` provisioner.
- You can modify the `inline` commands in the `main.tf` file to execute any other setup commands you want on your Raspberry Pis, such as installing additional software, configuring services, or setting up networking.

---

Great! Now that we’ve applied the basic configuration for provisioning your Raspberry Pis with Docker (or any other setup you like), let’s move to **Step 5: Monitoring and Verification**.

In this step, we'll focus on verifying that everything is working as expected:

---

### **Step 5: Monitoring and Verification**

Once you’ve run `terraform apply`, it’s important to verify that the configuration has been applied correctly to the Raspberry Pis and that the desired software (e.g., Docker) is installed.

We’ll walk through two main tasks for verification:

1. **Check SSH Connectivity** to each Raspberry Pi.
2. **Verify the Software Installation** on each Raspberry Pi (e.g., Docker).

---

### **5.1: Check SSH Connectivity**

1. **Manually SSH into Each Raspberry Pi**:
   You should check if Terraform successfully connected to each Raspberry Pi via SSH and ran the commands.

   Use the following command to SSH into each Raspberry Pi (replace the IP and username with the correct ones from `terraform.tfvars`):
   ```bash
   ssh pi1@192.168.1.101
   ```

   - If everything is set up correctly, you should be able to connect to each Raspberry Pi without entering a password (thanks to the SSH private key).

2. **Verify Each Raspberry Pi’s SSH User**:
   Ensure that the correct username (e.g., `pi1` for `192.168.1.101`, `pi2` for `192.168.1.102`) is being used, and that the SSH keys are correctly configured.

---

### **5.2: Verify Software Installation (e.g., Docker)**

1. **Check Docker Installation**:
   Run the following command on each Raspberry Pi to verify Docker is installed:
   ```bash
   docker --version
   ```

   This should output the version of Docker installed on the Raspberry Pi, confirming that the provisioning step worked.

2. **Verify the Docker Service**:
   You can also check if the Docker service is running:
   ```bash
   sudo systemctl status docker
   ```

   It should show that the Docker service is active and running.

---

### **5.3: Automated Monitoring (Optional)**

If you want to add a bit more monitoring, you can use Terraform's `output` feature to display key details after provisioning. For example, you can output the IPs of each Raspberry Pi, or the status of Docker:

1. **Add an Output to `main.tf`**:

   Update your `main.tf` file to output the IP addresses and SSH usernames. This will help you quickly verify the configuration:

   ```hcl
   output "raspberry_pi_ips" {
     value = var.raspberry_pi_ips
   }

   output "ssh_users" {
     value = var.ssh_users
   }
   ```

2. **Run `terraform apply` Again**:
   After modifying the `main.tf` file, run `terraform apply` again. It will show you the outputs you defined, including the IPs and usernames of the Raspberry Pis:
   ```bash
   terraform apply
   ```

   This way, you can quickly confirm the correct setup and IPs of the Pis.

---

### **5.4: Troubleshooting**

If you run into any issues, here are some common problems and solutions:

1. **SSH Connection Issues**:
   - Ensure that the SSH private key is correctly specified and accessible in your `terraform.tfvars` file.
   - Ensure that SSH access is allowed from your local machine to the Raspberry Pis (check firewall settings on both the local machine and Pi).

2. **Software Not Installing**:
   - If the provisioning command failed, run the Terraform plan again to see if any errors occurred.
   - Manually SSH into the Pi and run the installation commands to check if there are any issues with package installation.

3. **Other Issues**:
   - Check the Terraform output for detailed logs and error messages to help pinpoint the issue.

---

### **Next Steps: Automation and Scaling**

Once you’ve verified that the setup is working for your two Raspberry Pis, you can:

- **Extend to More Raspberry Pis**: Add more IPs and usernames to the `terraform.tfvars` file and extend the `main.tf` configuration to scale the setup.
- **Add More Software**: Customize the `inline` block in `main.tf` to install and configure more software (e.g., Kubernetes, Docker Compose).
- **Expand the Homelab**: Set up additional tools like monitoring, logging, CI/CD pipelines, and disaster recovery.

---

