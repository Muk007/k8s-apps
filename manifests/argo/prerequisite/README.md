# Argo CD Setup

This guide will walk you through the steps to set up Argo CD in your Kubernetes cluster.

## Prerequisites

- A running Kubernetes cluster.
- `kubectl` installed and configured to interact with your cluster.

## Step 1: Create the `argocd` Namespace

Before proceeding with the installation, you need to create the `argocd` namespace in your Kubernetes cluster. Run the following command:

```bash
kubectl create namespace argocd
```

## Step 2: Install argocd components in `argocd` Namespace

```bash
kubectl apply -f manifests/argo/prerequisite/install-argocd.yaml
```
