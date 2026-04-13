# Backend (Flask API)

## Purpose
REST API for product catalog data from PostgreSQL.

## Run locally
```bash
cd app/backend
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
DB_HOST=localhost DB_PORT=5432 POSTGRES_DB=eshopedb POSTGRES_USER=eshopeuser POSTGRES_PASSWORD=change-me-in-prod python app.py
```

Backend runs on `http://localhost:5000`.

## Docker
```bash
docker build -t eshope-backend:local .
docker run --rm -p 5000:5000 \
  -e DB_HOST=host.docker.internal \
  -e DB_PORT=5432 \
  -e POSTGRES_DB=eshopedb \
  -e POSTGRES_USER=eshopeuser \
  -e POSTGRES_PASSWORD=change-me-in-prod \
  eshope-backend:local
```

## Endpoints
- `GET /healthz`
- `GET /version`
- `GET /api/products`
