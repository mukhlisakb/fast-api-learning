#!/bin/sh

set -e

cd "$(dirname "$0")/.."
echo "Updating code..."
git fetch origin
git reset --hard origin/main

echo "Building new images..."
docker compose -f docker-compose.prod.yml build


echo "Deploying with rolling updates.."
docker compose -f docker-compose.prod.yml up -d --build app

echo "Deployment Successful!"