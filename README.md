# GitOps Repository

This repository serves as the source of truth for deploying and managing Kubernetes resources using the GitOps methodology. All manifests, configurations, and Kustomize overlays are stored here to ensure consistent, automated, and declarative deployments.

---

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Repository Structure](#repository-structure)
- [Getting Started](#getting-started)
- [ArgoCD Integration](#argocd-integration)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

GitOps is a way of implementing continuous delivery for cloud-native applications. This repository utilizes tools like **Kustomize** and **ArgoCD** to manage and deploy Kubernetes resources efficiently.

### Features:
- Declarative Kubernetes manifests
- Automated deployments via ArgoCD
- Multi-environment support (e.g., dev, staging, production)
- Version-controlled infrastructure

---

## Prerequisites

This guide will walk you through the steps to set up Argo CD in your Kubernetes cluster.

- A running Kubernetes cluster.
- `kubectl` installed and configured to interact with your cluster.

### Step 1: Create the `argocd` Namespace

Before proceeding with the installation, you need to create the `argocd` namespace in your Kubernetes cluster using below command

```bash
kubectl create namespace argocd
```

### Step 2: Install argocd components in `argocd` Namespace

```bash
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### Step 3: Change the argocd-server service type to `LoadBalancer`

```bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

### Step 4: Install the Project and Applications

```bash
kubectl apply -f core/argo/projects/project.yaml
kubectl apply -f core/argo/applications/application.yaml
```

### Step 5: Get the argo UI url (argocd-server service DNS or External IP) using below command and paste it on your browser

```bash
kubectl get svc argocd-server -n argocd
```

---
## Repository Structure

```plaintext
.
├── README.md
├── core
│   ├── argo
│   │   ├── applications
│   │   │   └── application.yaml
│   │   └── projects
│   │       └── project.yaml
│   └── kyverno
│       ├── README.md
│       └── policies
│           └── restrict-root-user-policy.yaml
├── logging
│   ├── README.md
│   └── values.yaml
├── manifests
│   └── apps
│       ├── accounts
│       │   ├── base
│       │   │   ├── deployment.yaml
│       │   │   ├── kustomization.yaml
│       │   │   ├── service.yaml
│       │   │   └── serviceaccount.yaml
│       │   └── overlays
│       │       └── dev
│       │           ├── deployment-patch.yaml
│       │           └── kustomization.yaml
│       ├── entity
│       │   ├── base
│       │   │   ├── deployment.yaml
│       │   │   ├── kustomization.yaml
│       │   │   ├── service.yaml
│       │   │   └── serviceaccount.yaml
│       │   └── overlays
│       │       └── dev
│       │           ├── deployment-patch.yaml
│       │           └── kustomization.yaml
│       └── generalledger
│           ├── base
│           │   ├── deployment.yaml
│           │   ├── kustomization.yaml
│           │   ├── service.yaml
│           │   └── serviceaccount.yaml
│           └── overlays
│               └── dev
│                   ├── deployment-patch.yaml
│                   └── kustomization.yaml
├── monitoring
│   ├── README.md
│   ├── dashboard_1.json
│   └── dashboard_2.json
└── scripts
    └── manifest-validation.sh

24 directories, 29 files
```
