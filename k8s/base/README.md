# Kubernetes Base Manifests

This folder is structured by layer:
- `shared/` namespace and common config
- `database/` PostgreSQL manifests
- `backend/` API manifests
- `frontend/` UI manifests

## Deploy
```bash
kubectl apply -k k8s/base
```
