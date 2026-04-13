# Kubernetes Shared Layer

## Files
- `namespace.yaml` - `eshope` namespace
- `configmap.yaml` - shared non-sensitive config (`API_URL`, DB host/port)

## Apply only shared layer
```bash
kubectl apply -f k8s/base/shared/
```
