# frozen_string_literal: true

class SyncRedditUserWorker
  include Sidekiq::Worker

  def perform(reddit_username)
    full_scrape_opts = {
      fetch_after: true,
      fetch_more: true,
      scrape_commented_post: true,
    }

    [
      RedditUrlGenerator.instance.user_overview(reddit_username),
      RedditUrlGenerator.instance.user_comments(reddit_username),
      RedditUrlGenerator.instance.user_about(reddit_username)
    ].each do |url|
      JobPlannerService.call(url, ProcessRedditResponseWorker, full_scrape_opts)
    end
  end
end
