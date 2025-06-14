# Chatbot Demo Tutorial

This tutorial guides you through the steps to build and execute a chatbot demo. It includes infrastructure provisioning, code build and publishing, database setup, and script execution.

---

## Table of Contents
1. [Infrastructure Provisioning](#infrastructure-provisioning)
2. [Code Build and Publishing](#code-build-and-publishing)
3. [Database Setup](#database-setup)
4. [Script Execution](#script-execution)

---

## Folder Structure

chatbot-poc/
├── README.md
├── .gitignore
├── .github/
│   └── workflows/
│       └── deploy.yml            # CI/CD pipeline
├── app/
│   ├── main.py                   # Chatbot app logic
│   ├── requirements.txt
│   ├── handlers/
│   │   └── openai_handler.py
│   └── utils/
│       └── prompts.py
├── infra/
│   ├── terraform/
│   │   ├── main.tf               # EKS + EC2 + S3 + IAM
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── modules/
│   └── ansible/                  # Optional: EC2 or K8s setup
│       └── setup_playbook.yml
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   └── secrets.yaml              # Base64 SSM outputs
├── helm/
│   └── chatbot-chart/            # If you want Helm deployment
├── monitoring/
│   ├── prometheus/
│   └── grafana/
│       └── dashboards/
├── scripts/
│   ├── docker_build.sh
│   ├── fetch_secrets.sh
│   └── apply_k8s.sh
└── docker/
    └── Dockerfile

## 1. Infrastructure Provisioning

### Prerequisites
- AWS CLI installed and configured.
- Terraform installed.

### Steps
1. Clone the repository:
    ```bash
    git clone https://github.com/your-repo/chatbot-demo.git
    cd chatbot-demo
    ```
2. Navigate to the infrastructure directory:
    ```bash
    cd infra
    ```
3. Initialize and apply Terraform:
    ```bash
    terraform init
    terraform apply
    ```
4. Note down the provisioned resources (e.g., S3 bucket, EC2 instance, RDS endpoint).

---

## 2. Code Build and Publishing

### Prerequisites
- Python 3.x installed.
- Docker installed (optional for containerized deployment).

### Steps
1. Navigate to the application directory:
    ```bash
    cd ../app
    ```
2. Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```
3. Build the application:
    ```bash
    python build.py
    ```
4. (Optional) Build and push Docker image:
    ```bash
    docker build -t chatbot-demo .
    docker tag chatbot-demo:latest <your-docker-repo>/chatbot-demo:latest
    docker push <your-docker-repo>/chatbot-demo:latest
    ```

---

## 3. Database Setup

### Prerequisites
- Access to the provisioned RDS instance.

### Steps
1. Connect to the RDS instance:
    ```bash
    psql -h <rds-endpoint> -U <username> -d <database>
    ```
2. Run the database schema script:
    ```sql
    \i db/schema.sql
    ```
3. Populate the database with initial data:
    ```sql
    \i db/seed.sql
    ```

---

## 4. Script Execution

### Prerequisites
- Ensure all infrastructure and dependencies are set up.

### Steps
1. Run the chatbot application:
    ```bash
    python chatbot.py
    ```
2. (Optional) Execute additional Bash scripts:
    ```bash
    ./scripts/setup.sh
    ./scripts/start.sh
    ```
3. Test the chatbot by interacting with the provided endpoint or UI.

---

## Conclusion

You have successfully built and executed the chatbot demo. For further customization, refer to the project documentation.

---