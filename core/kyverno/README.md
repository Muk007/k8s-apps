# Install Kyverno on Kubernetes

Kyverno is a policy engine for Kubernetes that allows you to define and enforce security rules easily. Follow the steps below to install and verify Kyverno in your cluster.

## Prerequisites
- A running Kubernetes cluster
- `kubectl` installed and configured
- `helm` installed

## Installation Steps

### 1. Add the Kyverno Helm Repository
```sh
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update
```

### 2. Install Kyverno using Helm
```sh
helm install kyverno kyverno/kyverno -n kyverno --create-namespace
```

### 3. (Alternative) Install Kyverno using `kubectl`
If you prefer to install Kyverno directly without Helm, use the following commands:
```sh
kubectl create namespace kyverno
kubectl apply -f https://github.com/kyverno/kyverno/releases/latest/download/install.yaml
```

### 4. Verify Kyverno Installation
Check if Kyverno pods are running:
```sh
kubectl get pods -n kyverno
```

Expected output should show Kyverno pods in `Running` state.

## Next Steps
- Deploy Kyverno policies to enforce security rules.
- Use `kubectl get clusterpolicy` to check applied policies.
- Visit the [Kyverno documentation](https://kyverno.io/) for more details.

---

Happy Policy Enforcing! 🚀
