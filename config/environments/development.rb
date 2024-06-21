require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Active Storage service URL expiration time
  config.active_storage.service_urls_expire_in = 2.days

  # Active Storage URL options
  config.active_storage.url_options = {
    host: 'localhost',  # 適切なホストを設定する
    port: 3000,          # 適切なポートを設定する
    protocol: 'http'     # HTTPまたはHTTPSを選択する
  }

  # Active Storage URL options for generating URLs
  config.after_initialize do
    Rails.application.routes.default_url_options = {
      host: 'localhost',
      port: 3000,
      protocol: 'http'
    }
    ActiveStorage::Current.host = 'http://localhost:3000'
  end

  # 既存の設定...
end
