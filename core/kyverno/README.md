# Kyverno Installation and Policy Enforcement Guide

## Install Kyverno

To install Kyverno using Helm, follow these steps:

```sh
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update
helm install kyverno kyverno/kyverno -n kyverno --create-namespace
```

Alternatively, install Kyverno using `kubectl`:

```sh
kubectl create namespace kyverno
kubectl apply -f https://github.com/kyverno/kyverno/releases/latest/download/install.yaml
```

Verify the installation:

```sh
kubectl get pods -n kyverno
```

## Example - Apply Security Policies

### Restrict Root User Policy

Create a policy file `restrict-root-user-policy.yaml`:

```yaml
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: restrict-root-user
spec:
  validationFailureAction: Enforce
  rules:
    - name: check-root-user
      match:
        resources:
          kinds:
            - Pod
      validate:
        message: "Running as root is not allowed."
        pattern:
          spec:
            securityContext:
              runAsNonRoot: true
```

Apply the policy:

```sh
kubectl create -f restrict-root-user-policy.yaml
```

Verify the policy:

```sh
kubectl get clusterpolicy
```

### Test the Policy

Create a test pod definition in `test-root-pod.yaml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: test-root-pod
spec:
  securityContext:
    runAsUser: 0
  containers:
    - name: busybox
      image: busybox
      command: ["sleep", "3600"]
```

Apply the test pod:

```sh
kubectl apply -f test-root-pod.yaml
```

Since the policy enforces non-root execution, the pod creation should fail with an error message indicating that running as root is not allowed.

---
This guide ensures a secure Kubernetes environment using Kyverno policies. Modify policies as needed for your specific security requirements. 🚀
