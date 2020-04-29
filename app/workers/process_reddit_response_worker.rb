# frozen_string_literal: true

class ProcessRedditResponseWorker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_options queue: :data_crunching

  sidekiq_throttle({
    concurrency: { limit: 1 },
  })

  def perform(redis_key, opts)
    @opts = opts
    data = REDIS_POOL.with { |c| c.get(redis_key) }
    return if data.blank?

    data = JSON.parse(data)
    CreateRedditObjectService.call(data)
  end
end
