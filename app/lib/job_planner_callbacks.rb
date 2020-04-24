class JobPlannerCallbacks
  def fetch_complete(status, options)
    key_prefix = options['key_prefix']
    job_klass = options['job_klass'].constantize

    batch = Sidekiq::Batch.new(status.parent_bid)
    batch.jobs do
      job_klass.perform_async(key_prefix)
    end
  end

  def clear_redis_cache(status, options)
    key_prefix = options['key_prefix']
    REDIS_POOL.with do |c|
      keys = c.keys("#{key_prefix}:*")
      c.del(keys)
    end
  end
end
