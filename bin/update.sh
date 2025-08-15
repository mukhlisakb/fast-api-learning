#!/bin/sh

set -e

cd /Users/ruxxcon/dev/learn-python/auth-learning/auth-testing/app
echo "Updating code..."
git fetch origin
git reset --hard origin/main

echo "Building new images..."
docker-compose -f docker-compose.prod.yml up build

echo "Deploying with rolling updates.."
docker-compose -f docker-compose.prod.yml up -d --no-dep --build

echo "Deployment Successful!"