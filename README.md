# **Homelab-v2**

This repository documents my hands-on journey in mastering SRE and DevOps skills by rebuilding my Homelab. It starts with managing infrastructure on Raspberry Pis and evolves to deploying scalable, cloud-native solutions on Azure.

---

## **Phases of the Journey**
This project is divided into multiple phases, each focusing on a key aspect of SRE and DevOps:

1. **[Phase 1: Setup and Preparation](docs/phase-1-setup.md)**  
   Setting up the foundational environment with Raspberry Pis.
2. **[Phase 2: Infrastructure as Code](docs/phase-2-infra-as-code.md)**  
   Automating infrastructure provisioning with Terraform.
3. **[Phase 3: Configuration Management](docs/phase-3-configuration-management.md)**  
   Managing and automating system configurations with Ansible.
4. **[Phase 4: Containerization and Orchestration](docs/phase-4-containerization-and-orchestration.md)**  
   Deploying and managing containers with Docker and Kubernetes (k3s).
5. **[Phase 5: CI/CD Pipelines](docs/phase-5.md)**  
   Building pipelines to automate application deployment.
6. **[Phase 6: Monitoring and Logging](docs/phase-6.md)**  
   Implementing monitoring (Prometheus, Grafana) and centralized logging (ELK Stack).
7. **[Phase 7: Chaos Engineering](docs/phase-7.md)**  
   Testing system resilience using tools like Chaos Mesh and LitmusChaos.
8. **[Phase 8: Backup and Disaster Recovery](docs/phase-8.md)**  
   Setting up automated backups and recovery solutions.
9. **[Phase 9: Migration to Azure](docs/phase-9-migration-to-azure.md)**  
   Migrating the Homelab setup to Azure for scalability.

---

## **Tools and Technologies**
This project leverages a variety of industry-standard tools and technologies:

### **Infrastructure Management**
- **Terraform**: Infrastructure as Code (IaC) for provisioning resources.
- **Ansible**: Configuration management and automation.

### **Containerization and Orchestration**
- **Docker**: Containerization.
- **Kubernetes**: Lightweight k3s for on-premises and AKS for cloud orchestration.

### **Monitoring and Logging**
- **Prometheus & Grafana**: System monitoring and visualization.
- **ELK Stack (Elasticsearch, Logstash, Kibana)**: Centralized logging.

### **Cloud Platform**
- **Azure**: Hosting cloud-native solutions.

### **CI/CD Tools**
- **Jenkins**, **GitHub Actions**: Pipeline automation.

### **Chaos Engineering**
- **Chaos Mesh**, **LitmusChaos**: Simulating failures to improve resilience.

### **Backup Solutions**
- Custom scripts and Azure Backup for disaster recovery.

---

## **Repository Structure**
The repository is structured to organize code, configurations, and documentation logically:

```
Homelab-v2/
│
├── terraform/             # Terraform configurations for infrastructure
│   ├── raspberry-pis/     # Terraform files for local Raspberry Pi setup
│   └── azure/             # Terraform files for Azure migration
├── ansible/               # Ansible playbooks for configuration management
├── kubernetes/            # Kubernetes manifests and Helm charts
├── ci-cd/                 # CI/CD pipeline configurations (Jenkins, GitHub Actions)
├── monitoring/            # Monitoring setup (Prometheus, Grafana, ELK)
├── backups/               # Backup scripts and disaster recovery setups
├── chaos-engineering/     # Scripts and configs for Chaos Mesh/LitmusChaos
├── docs/                  # Documentation for each phase
│   ├── phase-1-setup.md
│   ├── phase-2-infra-as-code.md
│   ├── phase-3-configuration-management.md
│   ├── phase-4-containerization-and-orchestration.md
│   ├── phase-5.md
│   ├── phase-6.md
│   ├── phase-7.md
│   ├── phase-8.md
│   └── phase-9-migration-to-azure.md
└── README.md              # Project overview
```

---

## **How to Use This Repository**
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Homelab-v2.git
   cd Homelab-v2
   ```
2. Navigate to the desired phase in the `docs/` directory to view instructions and configurations.
3. Execute the scripts or configurations under the corresponding tool directory (e.g., `terraform/` for infrastructure setup).
4. Review progress and additional insights in the documentation.

---

## **Goals**
This project aims to:
1. Build hands-on expertise in modern SRE and DevOps practices.
2. Automate infrastructure provisioning, configuration, and deployment.
3. Create a scalable, resilient system both on-premises and in the cloud.
4. Transition on-premises workloads (Raspberry Pis) to a cloud-native architecture (Azure).

---

## **Next Steps**
- For detailed instructions, check the documentation under the `docs/` directory.
- Stay tuned for updates as the journey progresses!

 ---

Test 2