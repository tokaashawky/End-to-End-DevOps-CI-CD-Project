# 🚀 Terraform Infrastructure for DevOps CI/CD Project

This Terraform configuration automates the provisioning of a complete AWS infrastructure for a CI/CD pipeline.\
It uses a modular architecture to manage networking, compute, storage, EKS, and other essential AWS services.

---

## 📦 Modules Structure
```
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── scripts/
│ └── install_jenkins.sh
├── modules/
│ ├── vpc/
│ ├── subnets/
│ ├── igw/
│ ├── nat_gateway/
│ ├── route_tables/
│ ├── sg/
│ ├── ec2/
│ ├── rds/
│ ├── ecr/
│ ├── alb/
│ └── eks/
```

---

## ⚙️ What This Terraform Code Provisions

This Terraform setup provisions the full infrastructure required for a scalable, secure DevOps architecture.\
 It's organized into three logical layers:

---

### 🔹 Layer 1: Networking Infrastructure (VPC)

```
VPC CIDR: 10.0.0.0/16
├── 2 Public Subnets:   10.0.1.0/24, 10.0.2.0/24
├── 2 Private Subnets:  10.0.3.0/24, 10.0.4.0/24
├── Internet Gateway (IGW)
├── NAT Gateway
├── Public Route Table (for IGW)
└── Private Route Table (via NAT)
```

---

### 🔹 Layer 2: Core Services

| Resource         | Location         | Description                           |
|------------------|------------------|---------------------------------------|
| Bastion Host     | Public Subnet    | SSH access to private infrastructure  |
| Jenkins          | Public Subnet    | CI/CD pipeline runner                 |
| ECR              | AWS Region-wide  | Container registry for Docker images  |
| RDS (MySQL)      | Private Subnet   | Jenkins/backend DB                    |
| Redis *(optional)* | Private Subnet | Caching layer for backend app         |
| Backend EC2 App  | Private Subnet   | Node.js or similar backend (via Ansible) |

---

### 🔹 Layer 3: Kubernetes (EKS + Monitoring)

| Component    | Description                                                   |
|--------------|---------------------------------------------------------------|
| EKS Cluster  | Deployed in private subnets for secure workloads              |
| ArgoCD       | GitOps controller for Kubernetes                              |
| Prometheus   | Metrics collection from apps and system (node_exporter)       |
| Grafana      | Dashboards for Prometheus metrics                             |
| Ingress (ALB)| Public access to Prometheus, Grafana, and ArgoCD              |

---


## 📥 How to Use

### 1. Initialize Terraform
```bash
terraform init
```
### 2. Review the execution plan
```bash
terraform plan
```

### 3. Apply the configuration
```bash
terraform apply
```

📤 Outputs
```
- vpc_id
- subnet_ids
- ecr_repository_url
```