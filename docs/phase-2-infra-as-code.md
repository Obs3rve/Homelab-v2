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


