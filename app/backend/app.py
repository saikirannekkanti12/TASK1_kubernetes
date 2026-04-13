import os
from flask import Flask, jsonify
import psycopg2
from psycopg2.extras import RealDictCursor

app = Flask(__name__)


def get_connection():
    return psycopg2.connect(
        host=os.getenv("DB_HOST", "postgres"),
        port=os.getenv("DB_PORT", "5432"),
        dbname=os.getenv("POSTGRES_DB", "eshopedb"),
        user=os.getenv("POSTGRES_USER", "eshopeuser"),
        password=os.getenv("POSTGRES_PASSWORD", "change-me-in-prod"),
    )


@app.get("/healthz")
def healthz():
    return jsonify({"status": "ok"})




@app.get("/version")
def version():
    return jsonify({"version": os.getenv("APP_VERSION", "v1")})


@app.get("/api/products")
def list_products():
    with get_connection() as conn:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(
                """
                SELECT id, name, category, gender, price, image_url
                FROM products
                ORDER BY id
                """
            )
            rows = cur.fetchall()
    return jsonify(rows)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
