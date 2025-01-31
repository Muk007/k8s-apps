```bash
helm repo add grafana https://grafana.github.io/helm-charts
```

```bash
helm repo update
```

```bash
helm upgrade --install --values values.yaml loki grafana/loki-stack -n logging --create-namespace
```

All pods should ibe in ready state
```bash
kubectl get pods -n logging
```

```bash
kubectl get svc -n logging
```

```bash
kubectl port-forward -n logging --address 0.0.0.0 svc/grafana-loki 3000:80
```

```bash
access the grafana UI at http://<node's_public_ip>:3000
```
