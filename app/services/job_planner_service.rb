# frozen_string_literal: true

class JobPlannerService < ApplicationService
  def initialize(url, job_klass, fetch_opt)
    @url = URI.parse(url)
    @job_klass = job_klass
    @fetch_opt = fetch_opt
  end

  def call
    overall = Sidekiq::Batch.new
    overall.description = "Reddit API - #{@url} for #{@job_klass}"
    overall.on(:success, 'JobPlannerCallbacks#clear_redis_cache', 'key_prefix' => redis_key_prefix)

    overall.jobs do
      RedditApiPaginationWorker.perform_async(
        @url.to_s, redis_key_prefix, @fetch_opt, @job_klass.name
      )
    end
  end

  private

  def redis_key_prefix
    @redis_key_prefix ||= "app-temp:crawl:#{RedisUniqIdService.call}"
  end
end
