# frozen_string_literal: true

class ProcessRedditResponseWorker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_throttle({
    concurrency: { limit: 1 },
  })

  KIND_MAPPING = {
    't1' => CreateRedditCommentService,
    't2' => CreateRedditAccountService,
    't3' => CreateRedditLinkService,
    't5' => CreateRedditSubredditService,
  }.freeze

  def perform(redis_key)
    data = REDIS_POOL.with { |c| c.get(redis_key) }
    data = JSON.parse(data)
    process(data)
  end

  private

  def process(data)
    return if data.nil?

    if data.is_a?(Hash) && data.key?('kind')
      handle_reddit_obj(data)
    elsif data.is_a?(Array)
      data.each { |val| process(val) }
    else
      raise data
    end
  end

  def handle_reddit_obj(data)
    if KIND_MAPPING.key?(data['kind'])
      KIND_MAPPING[data['kind']].call(data['data'])
    elsif data['kind'] == 'Listing'
      process(data.dig('data', 'children'))
    elsif data['kind'] == 'more'
      nil
    else
      raise data['kind']
    end
  end
end
