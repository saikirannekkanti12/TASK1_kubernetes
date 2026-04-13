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
```
