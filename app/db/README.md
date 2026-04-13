# Database (PostgreSQL)

## Purpose
Stores ecommerce product data.

## Initialization
`init.sql` creates `products` table and seeds men/women clothing catalog.

## Run locally
```bash
docker run --name eshope-postgres --rm -p 5432:5432 \
  -e POSTGRES_DB=eshopedb \
  -e POSTGRES_USER=eshopeuser \
  -e POSTGRES_PASSWORD=change-me-in-prod \
  -v "$PWD/init.sql:/docker-entrypoint-initdb.d/init.sql:ro" \
  postgres:13-alpine
```
