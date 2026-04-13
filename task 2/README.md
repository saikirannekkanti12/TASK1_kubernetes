# Task 2 - Black Friday Resiliency Challenge

This folder contains advanced Kubernetes resources and runbooks to make **eShope** highly available, scalable, and resilient.

## Included artifacts

- `hpa/frontend-hpa.yaml` and `hpa/backend-hpa.yaml`
  - CPU-based autoscaling at **50%** target utilization.
- `backend/backend-v2-success-patch.yaml`
  - Simulates safe zero-downtime rollout from v1 to v2.
- `backend/backend-v2-broken-patch.yaml`
  - Intentionally breaks readiness to demonstrate rollout protection and rollback.
- `pdb/backend-pdb.yaml`
  - PodDisruptionBudget to keep backend available during voluntary disruptions.
- `database/cloudnativepg-cluster.yaml`
  - CloudNativePG `Cluster` resource for primary-replica PostgreSQL resilience.
- `scripts/load-test.sh`
  - Load generator to trigger HPA scaling.
- `scripts/rollout-demo.sh`
  - Automates successful rollout + failed rollout + rollback demonstration.

## Prerequisites

1. Metrics server installed (for HPA):
   ```bash
   kubectl top nodes
   ```
2. Existing base stack deployed:
   ```bash
   kubectl apply -k k8s/base
   ```
3. CloudNativePG operator installed (for DB HA):
   ```bash
   kubectl apply --server-side -f \
   https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/releases/cnpg-1.24.0.yaml
   ```

## 1) Apply HPA and PDB

```bash
kubectl apply -f "task 2/hpa/"
kubectl apply -f "task 2/pdb/"
```

Check scaling:
```bash
kubectl get hpa -n eshope
```

## 2) Simulate heavy traffic

```bash
bash "task 2/scripts/load-test.sh"
```

Watch scale-up:
```bash
kubectl get deploy -n eshope -w
```

## 3) Demonstrate zero-downtime rolling update and rollback

```bash
bash "task 2/scripts/rollout-demo.sh"
```

Manual commands (alternative):
```bash
kubectl -n eshope patch deployment backend-api --patch-file "task 2/backend/backend-v2-success-patch.yaml"
kubectl -n eshope rollout status deployment/backend-api
kubectl -n eshope patch deployment backend-api --patch-file "task 2/backend/backend-v2-broken-patch.yaml"
kubectl -n eshope rollout status deployment/backend-api --timeout=120s
kubectl -n eshope rollout undo deployment/backend-api
```

## 4) Database resilience with operator-managed PostgreSQL

```bash
kubectl apply -f "task 2/database/cloudnativepg-cluster.yaml"
kubectl get cluster -n eshope
```

## Stretch goal note: Cluster Autoscaler

Cluster autoscaler is cloud-provider specific (GKE/EKS/AKS). Configure node-pool autoscaling so pending pods created by HPA can be scheduled automatically.
