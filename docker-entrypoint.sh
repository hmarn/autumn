#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

# Run migrations
bundle exec rails db:migrate

# Run rails server
bundle exec rails server -b '0.0.0.0' -p 3000

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
