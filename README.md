# eShope 3-Tier Ecommerce Project (Men & Women Clothing)

This repository contains a complete 3-tier sample:

- **Frontend** (`app/frontend`) - Node.js + React app (port 80)
- **Backend** (`app/backend`) - Flask API (port 5000)
- **Database** (`app/db` + PostgreSQL) - products data and seed script (port 5432)
- **Kubernetes manifests** (`k8s/base`) - organized by layer: `shared`, `database`, `backend`, `frontend`

Each major folder has its own `README.md` with run details.

---

## 1) Run full project locally (recommended)

```bash
docker compose up --build
```

Endpoints:
- Frontend: http://localhost:8080
- Backend: http://localhost:5000/api/products

---

## 2) Run each layer manually

- Frontend instructions: `app/frontend/README.md`
- Backend instructions: `app/backend/README.md`
- Database instructions: `app/db/README.md`

---

## 3) Kubernetes deployment

Apply complete stack:

```bash
kubectl apply -k k8s/base
```

Folder structure:
- `k8s/base/shared` - namespace + configmap
- `k8s/base/database` - secret + pvc + postgres deployment/service
- `k8s/base/backend` - backend deployment/service
- `k8s/base/frontend` - frontend deployment/service

Layer-specific docs:
- `k8s/base/shared/README.md`
- `k8s/base/database/README.md`
- `k8s/base/backend/README.md`
- `k8s/base/frontend/README.md`

-------------------------------------------
For HPA working based on cpu usage, need install metric server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
-k8/base/frontend/frontend-hpa.yaml
-k8/base/backend/backend-hpa.yaml

----
