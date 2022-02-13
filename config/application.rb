# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    Dotenv.load
    config.assets.initialize_on_precompile = false
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.autoload_paths += %W[#{config.root}/lib]
    config.assets.paths << Rails.root.join('app/assets')
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { host: 'localhost:3000' }
    config.action_mailer.smtp_settings = {
      address: 'smtp.gmail.com',
      port: 587,
      domain: 'example.com',
      user_name: ENV['GMAIL_USERNAME'],
      password: ENV['GMAIL_PASSWORD'],
      authentication: 'plain',
      enable_starttls_auto: true
    }
    config.file_watcher = ActiveSupport::EventedFileUpdateChecker
    config.exceptions_app = routes
    config.active_job.queue_adapter = :sidekiq
  end
end
