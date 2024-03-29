#!/usr/bin/env bash
DOCKER_POSTGRES=$1
DATABASE_NAME=$2

echo "Creating DATABASE $2 in container $1"
CREATE_DB="CREATE DATABASE $DATABASE_NAME"

if ! docker exec "$DOCKER_POSTGRES" psql -U postgres -e POSTGRES_PASSWORD=postgres \
  -lqt | cut -d \| -f 1 | grep -q "$DATABASE_NAME"; then
  echo "Creating Database ${DATABASE_NAME}..."
  sleep 5
  docker exec "$DOCKER_POSTGRES" psql -U postgres -c "$CREATE_DB"
  sleep 5
fi
