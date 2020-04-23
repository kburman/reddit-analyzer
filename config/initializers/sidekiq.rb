SIDEKIQ_REDIS_URL = ENV.fetch('SIDEKIQ_REDIS_URL') { 'redis://localhost:6379/12' }

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Throttler
  end
  config.redis = { url: SIDEKIQ_REDIS_URL }
  schedule_file = 'config/schedule.yml'
  if File.exist?(schedule_file)
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end 

Sidekiq.configure_client do |config|
  config.redis = { url: SIDEKIQ_REDIS_URL }
end
