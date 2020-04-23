# frozen_string_literal: true

class RedditApiFetchWorker
  include Sidekiq::Worker

  sidekiq_options throttle: { threshold: 30, period: 1.minute }

  def perform(url, root_key, options)
    @url = url
    @options = options

    api_response = RedditApiFetchService.call(url, options=options)
    REDIS_POOL.with { |conn| conn.set(root_key, api_response[:data]) }

    api_response[:next_links].each do |key, link|
      RedditApiFetchWorker.perform_async(link, "#{root_key}:#{key}", options)
    end
  end
end
