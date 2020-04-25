# frozen_string_literal: true

class RedditApiPaginationWorker
  include Sidekiq::Worker

  def perform(url, redis_key_ns, fetch_opts, job_klass)
    batch.jobs do
      batch = Sidekiq::Batch.new
      batch.description = "Reddit API Paginator worker - #{redis_key_ns}"
      batch.on(:success, 'JobPlannerCallbacks#fetch_complete',
        {
          'key_prefix' => redis_key_ns,
          'job_klass' => job_klass,
          'job_args'=> [fetch_opts]
        })

      batch.jobs do
        RedditApiFetchWorker.perform_async(url, redis_key_ns, '__main__', fetch_opts)
      end
    end
  end
end
