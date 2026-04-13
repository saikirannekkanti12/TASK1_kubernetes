# Kubernetes Frontend Layer

## Files
- `deployment.yaml` - frontend Deployment (`nvenkatasaikiran/frontend:v1`)
- `service.yaml` - LoadBalancer service exposing port `80`

## Apply only frontend layer
```bash
kubectl apply -f k8s/base/frontend/
```
