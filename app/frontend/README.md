# Frontend (Node.js + React)

## Purpose
Flipkart-inspired ecommerce UI for men and women clothing.

## Run locally
```bash
cd app/frontend
npm install
API_URL=http://localhost:5000 npm start
```

Frontend runs on `http://localhost:80` by default.

## Docker
```bash
docker build -t eshope-frontend:local .
docker run --rm -p 8080:80 -e API_URL=http://host.docker.internal:5000 eshope-frontend:local
```

## Health check
- `GET /healthz`
