#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${NAMESPACE:-eshope}"

kubectl run -n "$NAMESPACE" load-generator --rm -it --image=busybox:1.36 --restart=Never -- \
  /bin/sh -c 'while true; do wget -q -O- http://frontend-service/ >/dev/null; done'
