#!/usr/bin/env bash
# Exit on error
set -o errexit

# Ensure script runs in the correct directory
cd /path/to/your/rails/app

# Update Gems to latest versions
bundle update

# Install necessary Gems
bundle install --jobs $(nproc) --retry 5

# Precompile assets
bundle exec rake assets:precompile

# Clean up assets (optional)
bundle exec rake assets:clean

# Migrate database
bundle exec rake db:migrate
