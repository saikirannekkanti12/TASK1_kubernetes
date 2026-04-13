# Kubernetes Database Layer

## Files
- `secret.yaml` - PostgreSQL credentials
- `pvc.yaml` - `5Gi` PersistentVolumeClaim
- `deployment.yaml` - PostgreSQL Deployment (`postgres:13-alpine`)
- `service.yaml` - ClusterIP service on port `5432`

## Apply only database layer
```bash
kubectl apply -f k8s/base/database/
```
