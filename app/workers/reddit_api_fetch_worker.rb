# frozen_string_literal: true

class RedditApiFetchWorker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_options queue: :reddit_api
  sidekiq_throttle({
    concurrency: { limit: 3 },
    threshold: { limit: 30, period: 1.minute }
  })

  def perform(url, redis_key_ns, redis_key, fetcher_opt)
    api_response = RedditApiFetchService.call(url, fetcher_opt)
    REDIS_POOL.with do |conn|
      conn.set("#{redis_key_ns}:#{redis_key}", api_response[:data])
    end

    api_response[:next_links].each do |link_key, link|
      batch.jobs do
        RedditApiFetchWorker.perform_async(link, redis_key_ns, link_key, fetcher_opt)
      end
    end
  end
end
