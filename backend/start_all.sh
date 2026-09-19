#!/bin/bash
set -e

echo "Starting Celery Worker..."
celery -A tasks.celery_worker worker --loglevel=info --concurrency=1 &

echo "Starting Celery Beat..."
celery -A tasks.celery_worker beat --loglevel=info &

echo "Starting FastAPI..."
exec python start.py
