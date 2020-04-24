# frozen_string_literal: true

class SyncRedditUserWorker
  include Sidekiq::Worker

  def perform(reddit_username)
    reddit_url = "https://www.reddit.com/user/#{reddit_username}/comments/"
    JobPlannerService.call(reddit_url, SaveRedditResponseWorker, {
                             fetch_after: true,
                             fetch_more: true
                           })
  end
end
