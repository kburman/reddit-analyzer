# frozen_string_literal: true

class SyncRedditUserWorker
  include Sidekiq::Worker

  def perform(reddit_username)
    reddit_url = RedditUrlGenerator.instance.user_comments(reddit_username)
    JobPlannerService.call(reddit_url, SaveRedditResponseWorker, {
                             fetch_after: true,
                             fetch_more: true
                           })
  end
end
