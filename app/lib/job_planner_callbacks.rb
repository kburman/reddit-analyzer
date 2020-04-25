# frozen_string_literal: true

class JobPlannerCallbacks
  def fetch_complete(status, options)
    key_prefix = options['key_prefix']
    job_args = options['job_args']
    job_klass = options['job_klass'].constantize

    batch = Sidekiq::Batch.new(status.parent_bid)
    batch.jobs do
      NullWorker.perform_async

      REDIS_POOL.with do |c|
        c.keys("#{key_prefix}:*").each do |key|
          ProcessRedditResponseWorker.perform_async(key, *job_args)
        end
      end
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
