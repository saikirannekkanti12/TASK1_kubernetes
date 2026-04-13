#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${NAMESPACE:-eshope}"

# Successful v2 rollout
kubectl -n "$NAMESPACE" patch deployment backend-api --patch-file "task 2/backend/backend-v2-success-patch.yaml"
kubectl -n "$NAMESPACE" rollout status deployment/backend-api

# Intentionally broken rollout
kubectl -n "$NAMESPACE" patch deployment backend-api --patch-file "task 2/backend/backend-v2-broken-patch.yaml"
if ! kubectl -n "$NAMESPACE" rollout status deployment/backend-api --timeout=120s; then
  echo "Rollout failed as expected due to broken readiness probe."
  kubectl -n "$NAMESPACE" rollout undo deployment/backend-api
  kubectl -n "$NAMESPACE" rollout status deployment/backend-api
fi
