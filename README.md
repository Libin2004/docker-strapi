# Strapi Deployment on AWS ECS Fargate using Terraform and GitHub Actions

## Project Overview

This project demonstrates a complete CI/CD pipeline for deploying a containerized Strapi application on AWS ECS Fargate using Terraform. The deployment process is fully automated using GitHub Actions, from building the Docker image to updating the ECS task definition.

The goal of this project is to showcase practical DevOps skills including containerization, infrastructure as code, and automated cloud deployment.

---

## Architecture

GitHub → GitHub Actions → Docker → Amazon ECR → Terraform → ECS Fargate

Workflow:

1. Code is pushed to GitHub.
2. GitHub Actions builds the Docker image.
3. The image is tagged using the commit SHA.
4. The image is pushed to Amazon ECR.
5. Terraform updates the ECS task definition.
6. ECS Fargate deploys the new container.

---

## Repository Structure

```
.
├── app/
│   └── Dockerfile
├── terraform/
│   ├── main.tf
│   ├── ecs.tf
│   ├── variables.tf
│   └── provider.tf
└── .github/workflows/
    ├── ci.yml
    └── terraform.yml
```

---

## Technologies Used

* AWS ECS Fargate
* Amazon ECR
* Terraform
* Docker
* GitHub Actions
* Strapi
* Node.js

---

## CI/CD Pipeline

### CI Workflow

The CI pipeline performs the following steps:

* Builds Docker image
* Tags image using commit SHA
* Pushes image to Amazon ECR

Triggered on:

```
push to any branch
```

---

### CD
