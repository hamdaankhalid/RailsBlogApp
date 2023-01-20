# frozen_string_literal: true

Sidekiq.configure_client do |config|
  config.redis = { url: "#{ENV.fetch('REDIS_URL')}/0", size: 1, network_timeout: 8,
                   ssl_params: {
                     verify_mode: OpenSSL::SSL::VERIFY_NONE
                   } }
end

Sidekiq.configure_server do |config|
  config.redis = { url: "#{ENV.fetch('REDIS_URL')}/0", size: 12, network_timeout: 8, ssl_params: {
    verify_mode: OpenSSL::SSL::VERIFY_NONE
  } }

  config.on(:startup) do
    schedule_file = "config/batch_schedule.yml"

    if File.exist?(schedule_file)
      Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
    end
  end
end

Sidekiq::Extensions.enable_delay!
