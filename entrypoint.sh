#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Wait for database to be ready
echo "Waiting for PostgreSQL to start..."
while ! pg_isready -h db -p 5432 -U postgres; do
  sleep 1
done

# Initialize database if needed
if [ ! -f /myapp/tmp/.db_initialized ]; then
  echo "Setting up database..."
  bundle exec rails db:create db:migrate db:seed
  touch /myapp/tmp/.db_initialized
else
  echo "Checking for migrations..."
  bundle exec rails db:migrate
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"