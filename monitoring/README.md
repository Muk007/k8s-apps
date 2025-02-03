# Helm Installation Guide for Prometheus and Grafana

This guide provides step-by-step instructions to deploy Prometheus, Grafana & node-exporter in Kubernetes using Helm.

## Prerequisites
- A running Kubernetes cluster
- Helm installed (`helm version` to check)
- `kubectl` installed and configured (`kubectl version` to check)

## Installation Steps

## Add namespace for monitoring stack
```sh
kubectl create namespace monitor
```

## Add Helm Repositories
```sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

## Install Prometheus
```sh
helm install prometheus prometheus-community/prometheus --namespace monitor
```

## Add Grafana Helm Repository
```sh
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

## Install Grafana
```sh
helm install grafana grafana/grafana --namespace monitor
```

## Port Forward Grafana Service
```sh
kubectl port-forward --address 0.0.0.0 svc/grafana 3000:80 --namespace monitor
```

## Retrieve Grafana Admin Password
```sh
kubectl get secret grafana -o jsonpath="{.data.admin-password}"  --namespace monitor | base64 -d && echo
```
