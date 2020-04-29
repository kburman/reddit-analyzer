class RedditKeyCacheService < ApplicationService
  def initialize(redis_key, expire_in=1.hour, &block)
    @redis_key = redis_key
    @expire_in = expire_in
    @remote_call = block
  end

  def call
    REDIS_POOL.with do |c|
      unless c.exists(@redis_key)
        c.set(@redis_key, '', ex: @expire_in)
        @remote_call.call
      end
    end
  end
end
