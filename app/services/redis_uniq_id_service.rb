# frozen_string_literal: true

class RedisUniqIdService < ApplicationService
  ID_KEY = 'app-internal:uniq-id-seq'

  def call
    REDIS_POOL.with { |c| c.incr(ID_KEY) }
  end
end
