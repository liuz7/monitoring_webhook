url = 'redis://localhost:6379/1'
redis_config = {
    url: url,
    namespace: 'sidekiq',
}

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end