# frozen_string_literal: true

class RedditApiPaginationWorker
  include Sidekiq::Worker

  def perform(url, redis_key, fetch_opts, job_klass)
    batch.jobs do
      batch = Sidekiq::Batch.new
      batch.description = "Reddit API Paginator worker - #{redis_key}"
      batch.on(:success, 'JobPlannerCallbacks#fetch_complete',
        {'key_prefix' => redis_key, 'job_klass' => job_klass})

      batch.jobs do
        RedditApiFetchWorker.perform_async(url, redis_key, fetch_opts)
      end
    end
  end
end
