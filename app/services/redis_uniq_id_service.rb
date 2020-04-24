class RedisUniqIdService < ApplicationService
  ID_KEY = "#{Process.pid}:app-uniq-id-seq".freeze

  def call
    REDIS_POOL.with { |c| "#{Process.pid}:#{c.incr(ID_KEY)}" }
  end
end
