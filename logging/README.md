# PLG Stack (Promtail, Loki & Grafana) Setup with Helm

This guide provides step-by-step instructions to deploy Loki, Grafana & Promtail in Kubernetes using Helm.

## Prerequisites
- A running Kubernetes cluster
- Helm installed (`helm version` to check)
- `kubectl` installed and configured (`kubectl version` to check)

## Installation Steps

### 1. Add the Grafana Helm Repository
```sh
helm repo add grafana https://grafana.github.io/helm-charts
```

### 2. Update the Helm Repository
```sh
helm repo update
```

### 3. Install Loki, Grafana & Promtail using Helm
```sh
helm upgrade --install --values values.yaml loki grafana/loki-stack -n logging --create-namespace
```

### 4. Verify All Pods Are in Ready State
```sh
kubectl get pods -n logging
```

### 5. Check the Created Services
```sh
kubectl get svc -n logging
```

### 6. Expose Grafana for Access
```sh
kubectl port-forward -n logging --address 0.0.0.0 svc/loki-grafana 3000:80 &
```

### 7. Access the Grafana UI
Open a web browser and navigate to:
```
http://<node's_public_ip>:3000
```

## Notes
- Default Grafana credentials (if not changed):
  - **Username:** `admin`
  - **Password:** `` (You can get the password from the secret called `loki-grafana`.)

## Troubleshooting
- If pods are not in a ready state, check logs:
  ```sh
  kubectl logs -n logging <pod-name>
  ```
- If the UI is not accessible, verify port-forwarding:
  ```sh
  kubectl get pods -n logging
  ```


