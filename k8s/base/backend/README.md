# Kubernetes Backend Layer

## Files
- `deployment.yaml` - backend Deployment (`nvenkatasaikiran/backendapi:v1`)
- `service.yaml` - ClusterIP service exposing port `5000`

Includes:
- init container waiting for PostgreSQL
- health probes on `/healthz`
- env vars from Secret + ConfigMap

## Apply only backend layer
```bash
kubectl apply -f k8s/base/backend/

kubectl apply -f k8/base/backend/deployment.yaml
kubectl apply -f k8/base/backend/service.yaml
kubectl apply -f k8/base/backend/hpa.yaml

2. Perform Zero-Downtime Update (v1 → v2)
kubectl set env deployment/backend-api VERSION=v2 -n eshope

***** Watch rollut
kubectl rollout status deployment/backend-api -n eshope
***** watch pods
kubectl get pods -n eshope -w


```
