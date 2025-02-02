# Helm Installation Guide for Prometheus and Grafana

## Add namespace for monitoring stack
```sh
kubectl add namespace monitoring
```

## Add Helm Repositories
```sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

## Install Prometheus
```sh
helm install prometheus prometheus-community/prometheusa --namespace monitoring
```

## Add Grafana Helm Repository
```sh
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

## Install Grafana
```sh
helm install grafana grafana/grafana --namespace monitoring
```

## Port Forward Grafana Service
```sh
kubectl port-forward --address 0.0.0.0 svc/grafana 3000:3000 --namespace monitoring
```

## Retrieve Grafana Admin Password
```sh
kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | ForEach-Object { [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($_)) } --namespace monitoring
```
