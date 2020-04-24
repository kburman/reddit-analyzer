# frozen_string_literal: true

class ProcessRedditResponseWorker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_throttle({
    concurrency: { limit: 1 },
  })

  def perform(redis_key)
    data = REDIS_POOL.with { |c| c.get(redis_key) }
    data = JSON.parse(data)
    process(data)
  end

  private

  def process(data)
    if data.is_a?(Hash) && data.key?('kind')
      handle_reddit_obj(data)
    elsif data.is_a?(Array)
      data.each { |val| process(val) }
    else
      raise data
    end
  end

  def handle_reddit_obj(data)
    puts(data)
  end
end
