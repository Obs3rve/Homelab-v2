# Homelab-v2

This repository documents my hands-on journey in mastering SRE and DevOps skills by rebuilding my Homelab. It starts with managing infrastructure on Raspberry Pis and evolves to deploying scalable, cloud-native solutions on Azure.

## Phases of the Journey
1. **[Phase 1: Setup and Preparation](docs/phase-1-setup.md)**
2. **[Phase 2: Infrastructure as Code](docs/phase-2-infra-as-code.md)**
3. **[Phase 3: Configuration Management](docs/phase-3-configuration-management.md)**
4. **[Phase 4: Containerization and Orchestration](docs/phase-4-containerization-and-orchestration.md)**
5. **Phase 5: CI/CD Pipelines**
6. **Phase 6: Monitoring and Logging**
7. **Phase 7: Chaos Engineering**
8. **Phase 8: Backup and Disaster Recovery**
9. **[Phase 9: Migration to Azure](docs/phase-9-migration-to-azure.md)**

## Tools and Technologies
- **Infrastructure as Code**: Terraform
- **Configuration Management**: Ansible
- **Orchestration**: Kubernetes (k3s and AKS)
- **Monitoring**: Prometheus, Grafana, ELK Stack
- **Cloud**: Azure

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
│   ├── phase-5
│   ├── phase-6
│   ├── phase-7
│   ├── phase-8
│   └── phase-9
└── README.md              # Project overview


## How to Use This Repository
- Each phase has its own documentation file under the `docs/` directory.
- Configurations and scripts are organized by tool (e.g., `terraform/`, `ansible/`).

## Goals
- Build hands-on expertise in SRE and DevOps.
- Migrate projects from on-premises (Raspberry Pis) to the cloud (Azure).
